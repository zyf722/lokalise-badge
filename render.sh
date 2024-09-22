RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RESET='\033[0m'
color_echo() {
  echo -e "$1$2$RESET"
}

LOGO_SVG="$(cat lokalise.svg | sed 's/"/\\"/g')"
echo -n "Fetching project info from Lokalise API... "
CURL_RESULT=$(curl -s -X GET -H 'Accept: application/json' -H "X-Api-Token: $API_TOKEN" "https://api.lokalise.com/api2/projects/$PROJECT_ID")
if [ $? -ne 0 ]; then
  color_echo $RED "Failed."
  color_echo $RED "\nFailed to call Lokalise API with cURL."
  exit 1
elif [ "$(echo $CURL_RESULT | jq -r '.project_id')" != "$PROJECT_ID" ]; then
  color_echo $RED "Failed."
  color_echo $RED "\nFailed to fetch project info from Lokalise API. Got unexpected response:"
  color_echo $YELLOW "$CURL_RESULT"
  exit 1
fi
color_echo $GREEN "Done."

if [ ! -d "badges" ]; then
  echo "Creating 'badges' directory..."
  mkdir "badges"
fi

render_badge() {
  # Check https://shields.io/badges/endpoint-badge for badge schema
  local MESSAGE="$1"
  local QUERY="{schemaVersion: 1, label: \"Lokalise\", message: \"$MESSAGE\", color: \"green\", logoSvg: \"$LOGO_SVG\"}"
  local BADGE=$(echo $CURL_RESULT | jq --indent 2 "$QUERY")

  if [ $? -ne 0 ]; then
    color_echo $RED "Failed."
    color_echo $RED "\nFailed to render badge with message:"
    color_echo $YELLOW "$MESSAGE"
    exit 1
  fi

  echo $BADGE
  return 0
}

# Add new badges in meta.json
# Check https://developers.lokalise.com/reference/retrieve-a-project-1 for API response JSON schema
declare -A BADGES="($(cat meta.json | jq -r 'to_entries[] | @sh "[\(.key)]=\(.value)"'))"

for BADGE_NAME in "${!BADGES[@]}"; do
  echo -n "Rendering badge: '$BADGE_NAME'... "
  render_badge "${BADGES[$BADGE_NAME]}" >"badges/$BADGE_NAME.json"
  color_echo $GREEN "Done."
done
