
import 'package:exchange_rates_flutter/model/Currency.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';
import 'package:exchange_rates_flutter/constanst/index.dart';
class AppState {
  final List<Currency> currencies;
  final List<Converter> converters;

  AppState({this.currencies, this.converters});

  factory AppState.initial() => AppState(
    currencies: List.unmodifiable([]),
    //converters: List.unmodifiable([new Converter(id:0, currencyFrom: RUB, currencyTo: RUB, convertFrom: 1, convertTo: 1)]),
    converters: List.unmodifiable([new Converter(currency: RUB, value: 1)]),
  );
}
