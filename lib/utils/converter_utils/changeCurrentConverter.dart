import 'dart:convert';
import 'package:exchange_rates_flutter/model/Converter.dart';
import 'package:exchange_rates_flutter/utils/preference_utils/saveConvertersToPref.dart';

List<Converter> changeCurrentConverter(List<Converter> converters, Converter currentConverter) {
  for(Converter converter in converters) {
    if (converter.currency.id == currentConverter.currency.id)
      converter.isCurrent = true;
    else
      converter.isCurrent = false;
  }
  saveConvertersToPref(converters);
  return converters;
}