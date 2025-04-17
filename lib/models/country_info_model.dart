class CurrencyInfo {
  final String currencyCode;
  final String countryName;
  final String flagUrl;
  String? symbol;

  CurrencyInfo({
    this.symbol,
    required this.currencyCode,
    required this.countryName,
    required this.flagUrl,
  });
}
