import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/model/ViewModel.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';

class ConverterCard extends StatelessWidget {
  final Converter converter;
  final Color colorCard;
  ConverterCard(this.converter, this.colorCard);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return StoreConnector<AppState, ViewModel>(
        converter: ViewModel.fromStore,
        builder: (context, vm) {
//          FocusNode focus = new FocusNode();
//          FocusScope.of(context).requestFocus(focus);

        return new InkWell(
                    onTap: () {
                      //FocusScope.of(context).requestFocus(focus);
                      vm.changeConverter(converter);
                    },
                    child: Card(
                        color: colorCard,
                        child: Dismissible(
                          confirmDismiss: (direction) async {
                            if (converter.currency.charCode == 'RUB' ||
                                converter.currency.charCode == 'USD' ||
                                converter.currency.charCode == 'EUR') return false;
                            return true;
                          },
                          key: Key(converter.currency.id),
                          onDismissed: (direction) {
                            vm.deleteConverter(converter);
                          },
                          child: ListTile(
                            leading: Tab(
                              icon: Image.asset(
                                  "assets/flags/${converter.currency.charCode[0].toLowerCase() + converter.currency.charCode[1].toLowerCase()}_flag.png"),
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
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                                controller: TextEditingController()
                                  ..text = converter.value != 0
                                      ? converter.value.toStringAsFixed(2)
                                      : '',
                                textAlign: TextAlign.right,
                                cursorColor: Colors.white70,
                                //focusNode: focus,
                                onTap: () {
                                  print(
                                      '${converter.currency.charCode}=${converter.isCurrent}');
                                  vm.nullConverters();
                                  vm.changeConverter(converter);
                                },
                                onSubmitted: (text) {
                                  double val = double.tryParse(text);
                                  vm.editConverter(val, converter);
                                  //vm.changeConverter(converter); зачем?
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                        )));
  },);}
}

typedef OnDeleteConverterClicked = Function(Converter converter);
