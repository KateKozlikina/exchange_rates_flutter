import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/redux/middleware.dart';
import 'package:exchange_rates_flutter/model/Currency.dart';
import 'package:exchange_rates_flutter/common/Drawer.dart';
class CurrencySelect extends StatelessWidget {

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
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) => CurrencyGrid(state.currencies),
      ),
    );
  }
}

class CurrencyGrid extends StatelessWidget {
  final List<Currency> currencies;

  CurrencyGrid(this.currencies);

  @override
  Widget build(BuildContext context) {
    print(currencies);
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 10.0,
      crossAxisCount: 2,
      children: currencies.map((currencyInfo) {
        return Card(
          color: Colors.black87,
          child: ListTile(
              leading: Tab(
                icon: Image.asset(
                    "assets/flags/${currencyInfo.charCode[0].toLowerCase() + currencyInfo.charCode[1].toLowerCase()}_flag.png"),
                //"assets/flag/ab_flag.png")
                //загружаем картинку как иконку
              ),
              title: Text('${currencyInfo.charCode}', style: TextStyle(color: Colors.white),),
              subtitle: Text(currencyInfo.name, style: TextStyle(color: Colors.white70)),
              //onTap: ,
          ),
        );
      }).toList(),
    );
  }
}