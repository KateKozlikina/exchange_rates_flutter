import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:exchange_rates_flutter/model/Currency.dart';

class CurrencyList extends StatelessWidget {
  final List<Currency> currencies;

  CurrencyList(this.currencies);

  Widget currencyDiff(double value, double previous) {
    num diff = value - previous;
    if (diff >= 0)
      return Text('+${diff.toStringAsFixed(4)} ▲',
          style: TextStyle(color: Colors.green));
    return Text('${diff.toStringAsFixed(4)} ▼',
        style: TextStyle(color: Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    NumberFormat a = new NumberFormat();
    return new ListView(
        shrinkWrap: true,
        primary: false,
        children: currencies.map((currencyInfo) {
          return Card(
            color: Colors.black87,
            child: ListTile(
                leading: Tab(
                  icon: Image.asset(
                      "assets/flags/${currencyInfo.charCode[0].toLowerCase() + currencyInfo.charCode[1].toLowerCase()}_flag.png"),
                ),
                title: Text(
                  '${currencyInfo.nominal} ${a.simpleCurrencySymbol(currencyInfo.charCode)} = ${currencyInfo.value} ₽',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(currencyInfo.name,
                    style: TextStyle(color: Colors.white70)),
                trailing:
                    currencyDiff(currencyInfo.value, currencyInfo.previous)),
          );
        }).toList());
  }
}
