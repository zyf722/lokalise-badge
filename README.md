# lokalise-badge
This project is a simple way to display the progress of a lokalise project in a [Shields.io](https://shields.io/) badge.

![Badge](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fzyf722%2Flokalise-badge%2Fmain%2Fbadge.json)

## Set-up
Fork this repository and add the following secrets to your fork:

- `LOKALISE_API_TOKEN`: [API token](https://app.lokalise.com/profile#apitokens) for Lokalise. Read-only access is enough.
- `LOKALISE_PROJECT_ID`: The ID of the Lokalise project you want to track. You can find it in the URL of the project page or in `More... -> Settings -> Project ID`.

Then use the raw URL to `badge.json` in your fork repo to display the badge through [Endpoint Badge](https://shields.io/badges/endpoint-badge) support.

## License
[MIT](./LICENSE)

**Disclaimer**: This project is not affiliated with [Lokalise](https://lokalise.com/).