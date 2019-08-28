import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/redux/actions/converter_actions.dart';
import 'package:exchange_rates_flutter/model/Currency.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';

class CurrencyGrid extends StatelessWidget {
  final List<Currency> currencies;

  CurrencyGrid(this.currencies);

  @override
  Widget build(BuildContext context) {
    return new ListView(
        shrinkWrap: true,
        primary: false,
        children: currencies.map((currency) {
          return Card(
            color: Colors.black87,
            child: StoreConnector<AppState, OnAddConverterClicked>(
                converter: (store) {
                  return (converter) => store.dispatch(AddConverter(converter));
                },
                builder: (context, callback) {
                  return
                    ListTile(
                      leading: Tab(
                        icon: Image.asset(
                            "assets/flags/${currency.charCode[0].toLowerCase() +
                                currency.charCode[1].toLowerCase()}_flag.png"),
                      ),
                      title: Text(
                        '${currency.charCode}',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(currency.name,
                          style: TextStyle(color: Colors.white70)),
                      onTap: () {
                        Navigator.pop(context);
                        callback(Converter(currency: currency, value: 0.0));
                      },
                    );
                }
            ),
          );
        }).toList());
  }
}

typedef OnAddConverterClicked = Function(Converter converter);