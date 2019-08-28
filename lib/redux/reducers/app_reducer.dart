import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/redux/reducers/curencies_reducer.dart';
import 'package:exchange_rates_flutter/redux/reducers/converters_reducer.dart';
import 'package:exchange_rates_flutter/redux/reducers/loader_reducer.dart';


AppState appReducer(AppState state, action) {
  return AppState(
    currencies: currenciesReducer(state.currencies, action),
    converters: convertersReducer(state, action),
    isLoading: loaderReducer(state.isLoading, action),
  );
}