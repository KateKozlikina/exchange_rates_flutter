import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';
import 'package:exchange_rates_flutter/model/ConverterList.dart';
import 'package:exchange_rates_flutter/constanst/index.dart';

Future<List<Converter>> loadConvertersFromPref() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  try {
    var convertersString = sharedPreferences.getString(APP_CONVERTERS_KEY);
    Map convertersMap = json.decode(convertersString!=null ? convertersString : '');
    return new ConverterList.fromJson(convertersMap).converters;
  } catch(e) {
    return [];
  }
}