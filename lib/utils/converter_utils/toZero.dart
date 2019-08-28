import 'dart:convert';
import 'package:exchange_rates_flutter/model/Converter.dart';
import 'package:exchange_rates_flutter/utils/preference_utils/saveConvertersToPref.dart';


List<Converter> toZero(List<Converter> converters) {
  for(Converter converter in converters) {
    converter.value = 0;
  }
  saveConvertersToPref(converters);
  return converters;
}