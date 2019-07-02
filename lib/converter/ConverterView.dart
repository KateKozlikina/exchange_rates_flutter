import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/converter/ConverterList.dart';
import 'package:exchange_rates_flutter/common/Drawer.dart';

class ConverterView extends StatelessWidget {
  @override
  Widget build(BuildContext context)  {
    return new Scaffold(
      drawer: drawerApp(context),
      appBar: new AppBar(
        title: new Text(
          "Конвертер валют",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      body: StoreConnector<AppState, AppState>(

        converter: (store) => store.state,
        builder: (context, state) => ConverterList(state.currencies, state.converters),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, '/select-currency');
      },
        child: Icon(Icons.add),
      ),
    );
  }
}