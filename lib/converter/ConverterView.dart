import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/converter/ConverterList.dart';
import 'package:exchange_rates_flutter/common/Drawer.dart';
import 'package:exchange_rates_flutter/model/ViewModel.dart';

class ConverterView extends StatelessWidget {
  @override
  Widget build(BuildContext context)  {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: drawerApp(context),
      appBar: new AppBar(
        title: new Text(
          "Конвертер валют",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.pushNamed(context, '/select-currency');
            },
          ),
        ],
      ),
      body: StoreConnector<AppState, AppState>(
        onInit: (store) => ViewModel.addDefaultConverters(store),
        converter: (store) => store.state,
        builder: (context, state) => ConverterList(state.converters),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/select-currency');
        },
        backgroundColor: Colors.black87,
        child: Icon(Icons.add),
      ),
    );
  }
}