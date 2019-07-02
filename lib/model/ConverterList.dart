import 'package:exchange_rates_flutter/model/Converter.dart';
import 'dart:convert';
class ConverterList {
  List<Converter> converters;

  ConverterList(this.converters);


  Map<String, dynamic> toJson() {
    return {'converters': converters};
  }

  factory ConverterList.fromJson(Map<String, dynamic> parsedJson) {
    List<dynamic> parsedJsonCurrency = List<dynamic>.from(parsedJson['converters']);
    List<Converter> converters = new List<Converter>();
    parsedJsonCurrency.forEach((value) {
      converters.add(Converter.fromJson(value));
    });
    return new ConverterList(converters);
  }
  @override
  String toString() => "$converters";
}