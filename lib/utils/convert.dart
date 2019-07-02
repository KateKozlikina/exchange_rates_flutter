import 'package:exchange_rates_flutter/model/Converter.dart';
List<Converter> convert({double value, Converter convertFrom, List<Converter> converters}) {

  List<Converter> newConverters = converters;
  for(Converter converter in newConverters) {
    if (converter != convertFrom)
      converter.value = value * convertFrom.currency.value / convertFrom.currency.nominal / converter.currency.value * converter.currency.nominal;
    else
      converter.value = value;
  }
  print(newConverters);
  return newConverters;
}