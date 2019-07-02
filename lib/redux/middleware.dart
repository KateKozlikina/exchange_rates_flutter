import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/redux/actions.dart';
import 'package:exchange_rates_flutter/model/ConverterList.dart';
import 'package:exchange_rates_flutter/model/CurrencyList.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';
import 'package:redux_thunk/redux_thunk.dart';

//List<Middleware<AppState>> createStoreMiddleware() => [
//  TypedMiddleware<AppState, GetCurrencies>(_getCurrencies),
//];
//
//Future _getCurrencies(Store<AppState> store, GetCurrencies action, NextDispatcher next) async {
//  final response = await http.get('https://www.cbr-xml-daily.ru/daily_json.js');
//  print(response);
//  if (response.statusCode == 200) {
//    // If the call to the server was successful, parse the JSON
//    return CurrencyList.fromJson(json.decode(response.body));
//  } else {
//    // If that call was not successful, throw an error.
//    throw Exception('Failed to load post');
//  }
//}

const String APP_CONVERTERS_KEY = "APP_CONVERTERS";
// ThunkAction
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

//ThunkAction<AppState> getCurrencies = (Store<AppState> store) async {
//  CurrencyList currencies;
//  final response = await http.get('https://www.cbr-xml-daily.ru/daily_json.js');
//  if (response.statusCode == 200) {
//    currencies = CurrencyList.fromJson(json.decode(response.body));
//  } else {
//    throw Exception('Failed to load post');
//  }
//  store.dispatch(new GetCurrencies(currencies.currencies));
//};


ThunkAction<AppState> loadConverters = (Store<AppState> store) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var convertersString = sharedPreferences.getString(APP_CONVERTERS_KEY);
  Map convertersMap = json.decode(convertersString);
  ConverterList converterList = ConverterList.fromJson(convertersMap);
  store.dispatch(new LoadConverter(converterList.converters));
};

ThunkAction<AppState> saveConverters = (Store<AppState> store) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  ConverterList converterList = new ConverterList(store.state.converters);
  var convertersString = json.encode(converterList.toJson());
  await sharedPreferences.setString(APP_CONVERTERS_KEY, convertersString);
};

//void saveConvertersToPref(ConverterList currency) async {
//  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//  var convertersString = json.encode(currency.toJson());
//  await sharedPreferences.setString(APP_CONVERTERS_KEY, convertersString);
//}
//
List<Converter> loadConvertersFromPref() {
  SharedPreferences sharedPreferences;
  SharedPreferences.getInstance().then((value) => sharedPreferences = value) ;
  try {
    var convertersString = sharedPreferences.getString(APP_CONVERTERS_KEY);
    Map convertersMap = json.decode(convertersString!=null ? convertersString : '');
    return new ConverterList.fromJson(convertersMap).converters;
  } catch(e) {
      return [];
  }

}

//List<Converter> loadList() {
//  List<Converter> b;
//  loadConvertersFromPref().then((value) {
//    return value.converters;
//  }).catchError(() => []);
//
//  return b;
//}
//
//Future<SharedPreferences> getInstanceSP() async {
//  return await SharedPreferences.getInstance().;
//}