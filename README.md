# Currency Converter — Flutter

A Flutter learning project that combines live exchange-rate requests with country metadata to provide searchable currency selection and amount conversion.

## Features

- Welcome screen with navigation to the currency converter.
- Searchable source and target currency selectors.
- Currency selection using country names, currency codes, and flags.
- Amount conversion using USD-based exchange rates.
- Conversion results rounded to two decimal places.
- Loading indicators while currency data is fetched.
- Reusable Flutter UI components.

## Tech Stack

| Technology | Purpose |
|---|---|
| Flutter & Dart | Mobile application development |
| GetX | State management and navigation |
| HTTP | REST API integration |
| ExchangeRate-API | Currency exchange rates |
| REST Countries | Country names, currency metadata, and flags |
| dropdown_button2 | Currency selection UI |
| shimmer | Loading placeholders |
| google_fonts | Typography |

## How It Works

The application retrieves exchange rates with USD as the base currency and combines them with country information from REST Countries.

The conversion calculation is:

```text
convertedAmount = (amount / sourceRate) * targetRate
```

The result is rounded to two decimal places.

Exchange rates are fetched when the currency controller initializes. This is not a continuously updating market feed.

## Getting Started

### Prerequisites

- Flutter SDK with a compatible Dart version
- Android emulator, iOS simulator, or physical device
- Internet connection
- Valid ExchangeRate-API key

### Installation

Clone the repository:

```bash
git clone https://github.com/zuberjavedqureshi/currency_converter.git
```

Open the project directory:

```bash
cd currency_converter
```

Install dependencies:

```bash
flutter pub get
```

### API Configuration

Obtain your own API key from [ExchangeRate-API](https://www.exchangerate-api.com/).

Run the application with your key:

```bash
flutter run --dart-define=EXCHANGE_RATE_API_KEY=YOUR_API_KEY
```

The application reads this configuration using:

```dart
static const String apiKey = String.fromEnvironment(
  'EXCHANGE_RATE_API_KEY',
);
```

Without a valid API key, exchange-rate requests will not work.

**Security:** Do not commit API credentials to GitHub. Dart defines are build-time configuration values and are not secure secret storage in distributed mobile applications. A previously committed credential may remain visible in Git history and should be revoked by its provider.

## Project Structure

```text
lib/
├── main.dart
├── constants.dart
├── controllers/
│   └── controller.dart
├── models/
│   ├── countries_model.dart
│   └── country_info_model.dart
└── views/
    ├── welcome_view.dart
    ├── converter_view.dart
    └── components/
```

## Current Limitations

This repository is a Flutter learning project rather than a production-ready currency conversion application.

- Invalid or empty amount input needs better validation.
- Network failures need user-facing error messages and retry handling.
- Missing exchange rates currently fall back to `1.0`.
- Text controllers need improved lifecycle management.
- Initial loading makes duplicate rate requests.
- No dedicated Dart test suite is currently included.

## Validation

Run static analysis:

```bash
flutter analyze
```

Before relying on the application, manually test currency selection, conversion, invalid input, and network failure scenarios.

Builds and runtime behavior have not been verified as part of this documentation update.

## Author

**Zubair Qureshi**

Flutter Developer

[GitHub Profile](https://github.com/zuberjavedqureshi)

---

*Built as a hands-on Flutter project to practice REST API integration, GetX state management, JSON parsing, and reusable UI components.*
