import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:exchange_rates_flutter/redux/reducers.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:exchange_rates_flutter/converter/ConverterView.dart';
import 'package:exchange_rates_flutter/currencies/CurrenciesView.dart';
import 'package:exchange_rates_flutter/currencies/CurrencySelect.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState.initial(),
    middleware: [thunkMiddleware],
  );
  @override
  Widget build(BuildContext context) => StoreProvider(
      store: this.store,
      child: MaterialApp(
        title: 'Курс валют',
          initialRoute: '/',
          routes: {
            '/currency':(BuildContext context) => CurrenciesView(),
            '/converter':(BuildContext context) => ConverterView(),
            '/select-currency': (BuildContext context) => CurrencySelect()
          },
      )
  );
}
