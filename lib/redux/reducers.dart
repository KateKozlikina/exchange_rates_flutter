
import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/redux/actions.dart';
import 'package:exchange_rates_flutter/model/Currency.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';


AppState reducer(AppState state, action) {
  return AppState(
    currencies: currenciesReducer(state.currencies, action),
    converters: convertersReducer(state.converters, action),
  );
}

List<Currency> currenciesReducer(List<Currency> prev, dynamic action) {
if (action is GetCurrencies) {
    return action.currencies;
  } else {
    return prev;
  }
}

List<Converter> convertersReducer(List<Converter> prev, dynamic action) {
  List<Converter> newConverters = prev;
  if (action is AddConverter) {
    newConverters.add(action.converter);
    return newConverters;
  } else if(action is DeleteConverter) {
    newConverters.removeAt(action.idConverter);
    return newConverters;
  } else {
    return prev;
  }
}