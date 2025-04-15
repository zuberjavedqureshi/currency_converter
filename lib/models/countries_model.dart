import 'dart:convert';

import 'package:http/http.dart' as http;

List<String> sampleData = ['India', 'US', 'China', 'Pakistan'];

class CurrencyService {
  static const String apiKey =
      'YOUR_API_KEY_HERE'; // replace with your actual key
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
