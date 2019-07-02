import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:redux/redux.dart';

import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/redux/actions.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';
import 'package:exchange_rates_flutter/constanst/index.dart';
import 'package:exchange_rates_flutter/redux/reducers.dart';

class ViewModel {
  final Function editConverter;
  final Function deleteConverter;
  final Function changeConverter;
  final Function nullConverters;
  //final Function load;
//  final Converter currentConverter;
//
  ViewModel({this.editConverter, this.deleteConverter, this.changeConverter, this.nullConverters });

  static ViewModel fromStore(Store<AppState> store) {
    return ViewModel(
        editConverter: (value, converter) {
          store.dispatch(EditConverter(value, converter));
        },
        deleteConverter: (converter) {
          store.dispatch(DeleteConverter(converter));
        },
        changeConverter: (converter) {
          store.dispatch(ChangeConverter(converter));
        },
        nullConverters: () {
          store.dispatch(NullConverters());
        },
    );
  }


  static void addDefaultConverters(store, currencies) async {
    List<Converter> converters;
    converters = await loadConvertersFromPref();
    if (converters==null || converters.length == 0) {
      store.dispatch(AddConverter(
          new Converter(currency: RUB, value: 1, isCurrent: true)));
      store.dispatch(AddConverter(new Converter(
          currency: currencies.firstWhere((currency) => currency.charCode ==
              'USD'))));
      store.dispatch(AddConverter(new Converter(
          currency: currencies.firstWhere((currency) => currency.charCode ==
              'EUR'))));
    }
    else {
      store.dispatch(LoadConverter(converters));
    }
  }
}