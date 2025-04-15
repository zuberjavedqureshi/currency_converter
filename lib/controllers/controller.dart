import 'package:currency_converter_app/models/countries_model.dart';
import 'package:get/get.dart';

class CurrencyController extends GetxController {
  final CurrencyService _currencyService = CurrencyService();

  Map<String, dynamic> converionRates = {};
  String selectedCurrencyFrom = 'USD';
  String selectedCurrencyTo = 'INR';

  double convertedAmount = 0.0;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    fetchCurrencyRates();
    super.onInit();
  }

  void fetchCurrencyRates() async {
    _isLoading = true;
    update();

    try {
      converionRates = await _currencyService.fetchCurrencies();
    } catch (e) {
      Exception("Failed to fetch: $e");
    }

    _isLoading = false;
    update();
  }

  void setSelectedCurrencyFrom(String currency) {
    selectedCurrencyFrom = currency;
    update();
  }

  void setSelectedCurrencyTo(String currency) {
    selectedCurrencyTo = currency;
    update();
  }

  double convert(double amount, String from, String to) {
    final fromRate = converionRates[from] ?? 1.0;
    final toRate = converionRates[to] ?? 1.0;
    double result = (amount / fromRate * toRate);
    convertedAmount = double.parse(result.toStringAsFixed(2));
    update();
    return convertedAmount;
  }
}
