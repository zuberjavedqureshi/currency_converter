import 'dart:convert';

import 'package:http/http.dart' as http;

List<String> sampleData = ['India', 'US', 'China', 'Pakistan'];

class CurrencyService {
  static const String apiKey = "39e013fb22da88f9830f1b8e";
  static const String baseURL = "https://v6.exchangerate-api.com/v6";

  Future<Map<String, dynamic>> fetchCurrencies() async {
    final url = Uri.parse("$baseURL/$apiKey/latest/USD");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return data['conversion_rates'];
    } else {
      throw Exception('Failed to fetch currencies');
    }
  }
}
