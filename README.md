# lokalise-badge
This project is a simple way to display the progress of a lokalise project in a [Shields.io](https://shields.io/) badge.

![Translated](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fzyf722%2Flokalise-badge%2Fmain%2Fbadges%2Ftranslated.json)

![Languages](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fzyf722%2Flokalise-badge%2Fmain%2Fbadges%2Flanguages.json)

## Set-up
Fork this repository and add the following secrets to your fork:

- `LOKALISE_API_TOKEN`: [**API token**](https://app.lokalise.com/profile#apitokens) for Lokalise. Read-only access is enough. Please pay attention to [the difference between ***API token*** and ***SDK token***](https://docs.lokalise.com/en/articles/1929556-api-and-sdk-tokens).
- `LOKALISE_PROJECT_ID`: The ID of the Lokalise project you want to track. You can find it in the URL of the project page or in `More... -> Settings -> Project ID`.

> [!WARNING]
> As described in [Github Docs](https://docs.github.com/en/actions/managing-workflow-runs-and-deployments/managing-workflow-runs/disabling-and-enabling-a-workflow), scheduled workflows are disabled by default for forked repositories. You need to manually enable it in order to make the workflow work.

Then use the raw URL to `.json` files under `badges` folder in your fork repo to display them through [Endpoint Badge](https://shields.io/badges/endpoint-badge) support.

## Customization
Edit [`meta.json`](./meta.json) if you want to customize the badge content and/or add new badges.

The file is a JSON dictionary with its keys as the badge file name and its values as the badge message. The badge message is a jq string with filter to extract values needed from Lokalise API response.

## License
[MIT](./LICENSE)

**Disclaimer**: This project is not affiliated with [Lokalise](https://lokalise.com/).