import 'dart:convert';
import 'package:exchange_rates_flutter/model/Currency.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';

bool containsCurrency(List<Converter> converters, Currency currency) {
  for(Converter converter in converters) {
    if (converter.currency.id == currency.id)
      return true;
  }
  return false;
}
