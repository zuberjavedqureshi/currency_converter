import 'dart:convert';

import 'package:currency_converter_app/models/country_info_model.dart';
import 'package:http/http.dart' as http;

class CurrencyService {
  static const String apiKey = "39e013fb22da88f9830f1b8e";
  static const String baseURL = "https://v6.exchangerate-api.com/v6";
  final url = Uri.parse("$baseURL/$apiKey/latest/USD");

  Future<List<CurrencyInfo>> fetchCurrencies() async {
    final flagUrl = Uri.parse("https://restcountries.com/v3.1/all");

    final response = await http.get(url);
    final flagResponse = await http.get(flagUrl);

    if (response.statusCode == 200 && flagResponse.statusCode == 200) {
      // final data = json.decode(response.body);
      // final List flagData = json.decode(flagResponse.body);
      // return data['conversion_rates'];

      //We are taking only current exchange rates from exchangerate-api.com
      final Map<String, dynamic> currencyData =
          json.decode(utf8.decode(response.bodyBytes));
      //This will hold conversion rates.
      final Map<String, dynamic> conversionRates =
          currencyData['conversion_rates'];
      //This is coming from RESTApi for Country Name, Code, and Flags.
      final List flagData = json.decode(flagResponse.body);
      //Initialized this empty list for maping.
      final List<CurrencyInfo> result = [];

      for (var country in flagData) {
        if (country['currencies'] != null) {
          final currencyKeys = (country['currencies'] as Map).keys;
          //For fetching symbol we need key.first
          final firstKey = currencyKeys.first;
          for (var code in currencyKeys) {
            if (conversionRates.containsKey(code)) {
              result.add(CurrencyInfo(
                symbol: country['currencies'][code]['symbol'] ?? '',
                countryName: country['name']['common'] ?? '',
                currencyCode: code,
                flagUrl: country['flags']?['png'] ?? '',
              ));
            }
          }
        }
      }
      return result;
    } else {
      throw Exception('Failed to fetch currencies');
    }
  }

  Future<Map<String, dynamic>> conversionRatesAPI() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(utf8.decode(response.bodyBytes));
      return data['conversion_rates'];
    } else {
      throw Exception('Failed to fetch currencies');
    }
  }
}
