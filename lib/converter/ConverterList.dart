import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/model/ViewModel.dart';
import 'package:exchange_rates_flutter/model/Currency.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';



class ConverterList extends StatelessWidget {
  final List<Currency> currencies;
  final List<Converter> converters;

  ConverterList(this.currencies, this.converters);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return new ListView(
        shrinkWrap: true,
        primary: false,
        children: converters.map((converter) {
          return Card(
              color: Colors.black87,
              child: StoreConnector<AppState, ViewModel>(
//                  converter: (store) =>
//                      (converter) => store.dispatch(DeleteConverter(converter)),
                  converter: ViewModel.fromStore,
                  builder: (context, vm) {
                    return Dismissible(
                      key: Key(converter.currency.id),
                      onDismissed: (direction) {
                        vm.deleteConverter(converter);
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Валюта удалена из конвертера')));
                      },
                      child: ListTile(
                        leading: Tab(
                          icon: Image.asset(
                              "assets/flags/${converter.currency.charCode[0].toLowerCase() + converter.currency.charCode[1].toLowerCase()}_flag.png"),
                          //"assets/flag/ab_flag.png")
                          //загружаем картинку как иконку
                        ),
                        title: Text(
                          '${converter.currency.charCode}',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(converter.currency.name,
                            style: TextStyle(color: Colors.white70)),
                        trailing: Container(
                          width: 100.0,
                          child: TextField(
                            //controller: valueController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                            //initialValue: converter.value.toString(),
                            controller: TextEditingController()..text = converter.value.toStringAsFixed(2),
                            textAlign: TextAlign.right,
                            cursorColor: Colors.white70,
                            autofocus: false,
//                            onChanged: (text) {
//                              double val = double.tryParse(text);
//                              print(text);
//                              print(val);
//                              vm.editConverter(val, converter);
//                            },
                            onTap: () {
                              if(converter.currency.id!=vm.currentConverter.currency.id)
                                vm.nullConverters();
                            },
                            onSubmitted: (text) {
                              double val = double.tryParse(text);
                              print(text);
                              print(val);
                              vm.editConverter(val, converter);
                              vm.changeConverter(converter);
                            },
//                            maxLength: 6,
//                            maxLengthEnforced: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    );
                  })












              );
        }).toList());
  }
}

typedef OnDeleteConverterClicked = Function(Converter converter);