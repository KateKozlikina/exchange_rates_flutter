import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:exchange_rates_flutter/model/Currency.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';

class ConverterList extends StatelessWidget {
  final List<Currency> currencies;
  final List<Converter> converters;

  ConverterList(this.currencies, this.converters);

  @override
  Widget build(BuildContext context) {
    NumberFormat a = new NumberFormat();
    print(currencies);
    return new ListView(
        shrinkWrap: true,
        primary: false,
        children: converters.map((converter) {
          return Card(
            color: Colors.black87,
            child:
                ListTile(
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
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white, fontSize: 25.0,),
                  textAlign: TextAlign.right,
                  cursorColor: Colors.white70,
                  autofocus: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          );
        }).toList());
  }
}
