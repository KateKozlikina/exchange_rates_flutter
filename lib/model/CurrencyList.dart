import 'package:exchange_rates_flutter/model/Currency.dart';

class CurrencyList {
  final List<Currency> currencies;

  CurrencyList(this.currencies);

  factory CurrencyList.fromJson(Map<String, dynamic> parsedJson) {
    Map<String, dynamic> parsedJsonCurrency = parsedJson['Valute'];
    List<Currency> currencies = new List<Currency>();
    print(parsedJsonCurrency);
    parsedJsonCurrency.forEach((key, value) {
      currencies.add(Currency.fromJson(value));
    });
    //currencies = list.map((i) => Currency.fromJson(i)).toList();
    print(currencies[0]);
    return new CurrencyList(currencies);
  }
}