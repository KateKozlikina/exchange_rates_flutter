import 'dart:convert';
import 'package:redux/redux.dart';

import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/redux/actions/converter_actions.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';
import 'package:exchange_rates_flutter/model/Currency.dart';
import 'package:exchange_rates_flutter/constanst/index.dart';
import 'package:exchange_rates_flutter/utils/preference_utils/loadConvertersFromPref.dart';

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


  static void addDefaultConverters(Store<AppState> store) async {
    List<Converter> converters;
    List<Currency> currencies = store.state.currencies;
    converters = await loadConvertersFromPref();
    if (converters==null || converters.length == 0) {
      store.dispatch(AddConverter(
          new Converter(currency: RUB, value: 1, isCurrent: true)));
      store.dispatch(AddConverter(new Converter(
          currency: currencies.firstWhere((currency) => currency.charCode ==
              'USD'),
          isCurrent: false,
      )));
      store.dispatch(AddConverter(new Converter(
          currency: currencies.firstWhere((currency) => currency.charCode ==
              'EUR'),
          isCurrent: false)));
    }
    else {
      store.dispatch(LoadConverter(converters));
    }
  }
}