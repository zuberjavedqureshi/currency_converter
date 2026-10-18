# currency_converter_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## API Configuration

This application uses [ExchangeRate-API](https://www.exchangerate-api.com/) to retrieve currency exchange rates.

To run the application, obtain your own API key and provide it using Dart's `--dart-define` option:

```bash
flutter run --dart-define=EXCHANGE_RATE_API_KEY=YOUR_API_KEY
```

The API key is not included in the repository. Without a valid key, currency exchange rate requests will not work.

**Security note:** Do not commit API keys or other credentials to source control. Dart defines are build-time configuration values and should not be treated as secure storage for secrets in a distributed mobile application.
