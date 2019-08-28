import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/redux/actions/currency_actions.dart';
import 'package:exchange_rates_flutter/redux/actions/loading_actions.dart';

import 'package:exchange_rates_flutter/model/CurrencyList.dart';

ThunkAction<AppState> getCurrencies = (Store<AppState> store) async {
  CurrencyList currencies;
  store.dispatch(new loadingData());
  final response = await http.get('https://www.cbr-xml-daily.ru/daily_json.js');
  store.dispatch(new notLoadingData());
  if (response.statusCode == 200) {
    currencies = CurrencyList.fromJson(json.decode(response.body));
    store.dispatch(new GetCurrencies(currencies.currencies));
  } else {
    throw Exception('Failed to load');
  }
};