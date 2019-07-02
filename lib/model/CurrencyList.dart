import 'package:exchange_rates_flutter/model/Currency.dart';

class CurrencyList {
  final List<Currency> currencies;

  CurrencyList(this.currencies);

  factory CurrencyList.fromJson(Map<String, dynamic> parsedJson) {
    Map<String, dynamic> parsedJsonCurrency = parsedJson['Valute'];
    List<Currency> currencies = new List<Currency>();
    parsedJsonCurrency.forEach((key, value) {
      currencies.add(Currency.fromJson(value));
    });
    return new CurrencyList(currencies);
  }
}
