import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/redux/actions.dart';
import 'package:exchange_rates_flutter/model/CurrencyList.dart';
import 'package:exchange_rates_flutter/model/Currency.dart';
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

// ThunkAction
ThunkAction<AppState> getCurrencies = (Store<AppState> store) async {
//  http.Response response = await http.get(
//    Uri.encodeFull(
//        'http://quotesondesign.com/wp-json/posts?filter[orderby]=rand&filter[posts_per_page]=1'),
//  );
//  List<dynamic> result = json.decode(response.body);
//
//  // This is to remove the <p></p> html tag received. This code is not crucial.
//  String quote = result[0]['content']
//      .replaceAll(new RegExp('[(<p>)(</p>)]'), '')
//      .replaceAll(new RegExp('&#8217;'), '\'');
//  String author = result[0]['title'];
  CurrencyList currencies;
  final response = await http.get('https://www.cbr-xml-daily.ru/daily_json.js');
  print(response);
  if (response.statusCode == 200) {
    print('currenc ${response.body}');
    // If the call to the server was successful, parse the JSON
    print('currenc ${response.body}');
    currencies = CurrencyList.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
  print('currenc $currencies');
  store.dispatch(new GetCurrencies(currencies.currencies));
};