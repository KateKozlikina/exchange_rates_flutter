import 'package:exchange_rates_flutter/model/Converter.dart';
import 'dart:convert';
class ConverterList {
  List<Converter> converters;

  ConverterList(this.converters);

//  ConverterList.fromJson(Map<String, dynamic> parsedJson)
//      : converters = (parsedJson['converters'] as List)
//      .map((i) => new Converter.fromJson(i as Map<String, dynamic>))
//      .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {'converters': converters};
    print(map);
    return map;
  }

  factory ConverterList.fromJson(Map<String, dynamic> parsedJson) {
    List<dynamic> parsedJsonCurrency = List<dynamic>.from(parsedJson['converters']);
    //var parsedJsonCurrency = parsedJson['converters'];
    List<Converter> converters = new List<Converter>();
    parsedJsonCurrency.forEach((value) {
      print(value);
      Converter c = Converter.fromJson(value);
      converters.add(Converter.fromJson(value));
    });
    //currencies = list.map((i) => Currency.fromJson(i)).toList();
    //print(currencies[0]);
    return new ConverterList(converters);
  }
  @override
  String toString() => "$converters";
}