import 'package:currency_converter_app/models/countries_model.dart';
import 'package:currency_converter_app/models/country_info_model.dart';
import 'package:get/get.dart';

class CurrencyController extends GetxController {
  final CurrencyService _currencyService = CurrencyService();

  Map<String, dynamic> converionRatesAPI = {};
  // String selectedCurrencyFrom = 'USD';
  // String selectedCurrencyTo = 'INR';

  List<CurrencyInfo> converionRates = [];
  CurrencyInfo? selectedFrom;
  CurrencyInfo? selectedTo;

  double convertedAmount = 0.0;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    fetchCurrencyRates();
    super.onInit();
  }

  Future<void> fetchCurrencyRates() async {
    _isLoading = true;
    update();

    try {
      converionRates = (await _currencyService.fetchCurrencies());
      converionRatesAPI = (await _currencyService.conversionRatesAPI());

      selectedFrom = converionRates.first;
      selectedTo = converionRates[1];
    } catch (e) {
      Exception("Failed to fetch: $e");
    }

    _isLoading = false;
    update();
  }

  void setSelectedCurrencyFrom(CurrencyInfo? currency) {
    selectedFrom = currency;
    update();
  }

  void setSelectedCurrencyTo(CurrencyInfo? currency) {
    selectedTo = currency;
    update();
  }

  double convert(double amount, CurrencyInfo from, CurrencyInfo to) {
    final fromRate = converionRatesAPI[from.currencyCode] ?? 1.0;
    final toRate = converionRatesAPI[to.currencyCode] ?? 1.0;
    double result = (amount / fromRate * toRate);
    convertedAmount = double.parse(result.toStringAsFixed(2));
    update();
    return convertedAmount;
  }
}
