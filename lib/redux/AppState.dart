
import 'package:exchange_rates_flutter/model/Currency.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';
import 'package:exchange_rates_flutter/constanst/index.dart';
class AppState {
  final List<Currency> currencies;
  final List<Converter> converters;
  final Converter currentConverter;

  AppState({this.currencies, this.converters, this.currentConverter});


  factory AppState.initial() => AppState(
    currencies: List.unmodifiable([]),
    converters: [new Converter(currency: RUB, value: 1, isCurrent: true)].toList(),
    currentConverter: new Converter(currency: RUB, value: 1),
  );
}

