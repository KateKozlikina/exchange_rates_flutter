import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/redux/actions.dart';
import 'package:exchange_rates_flutter/model/CurrencyList.dart';
import 'package:redux_thunk/redux_thunk.dart';


const String APP_CONVERTERS_KEY = "APP_CONVERTERS";

ThunkAction<AppState> getCurrencies = (Store<AppState> store) async {
  CurrencyList currencies;
  final response = await http.get('https://www.cbr-xml-daily.ru/daily_json.js');
  if (response.statusCode == 200) {
    currencies = CurrencyList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
  store.dispatch(new GetCurrencies(currencies.currencies));
};