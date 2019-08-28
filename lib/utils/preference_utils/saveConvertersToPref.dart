import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';
import 'package:exchange_rates_flutter/model/ConverterList.dart';
import 'package:exchange_rates_flutter/constanst/index.dart';

void saveConvertersToPref(List<Converter> converters) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  var convertersString = json.encode(ConverterList(converters).toJson());
  await sharedPreferences.setString(APP_CONVERTERS_KEY, convertersString);
}