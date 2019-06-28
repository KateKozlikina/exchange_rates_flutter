import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/redux/middleware.dart';
import 'package:exchange_rates_flutter/currencies/CurrencyList.dart';
import 'package:exchange_rates_flutter/common/Drawer.dart';
class CurrenciesView extends StatelessWidget {

  @override
  Widget build(BuildContext context)  {
    return new Scaffold(
      drawer: drawerApp(context),
      appBar: new AppBar(
        title: new Text(
          "Курс валют",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      body: StoreBuilder<AppState>(
        onInit: (store) => store.dispatch(getCurrencies),
        builder: (context, store) => CurrencyList(store.state.currencies),
      ),
    );
  }
}