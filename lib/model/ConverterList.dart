import 'package:exchange_rates_flutter/model/Converter.dart';

class ConverterList {
  final List<Converter> converters;

  ConverterList(this.converters);

  ConverterList.fromJson(Map<String, dynamic> parsedJson)
      : converters = (parsedJson['converters'] as List)
      .map((i) => new Converter.fromJson(i as Map<String, dynamic>))
      .toList();

  Map<String, dynamic> toJson() => {'converters': converters};

  @override
  String toString() => "$converters";
}