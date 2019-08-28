import 'package:exchange_rates_flutter/redux/actions/currency_actions.dart';
import 'package:exchange_rates_flutter/model/Currency.dart';

List<Currency> currenciesReducer(List<Currency> prev, dynamic action) {
  if (action is GetCurrencies) {
    return action.currencies;
  } else {
    return prev;
  }
}