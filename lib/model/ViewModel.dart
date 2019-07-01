
import 'package:redux/redux.dart';

import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/redux/actions.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';

class ViewModel {
  final Function editConverter;
  final Function deleteConverter;
  final Function changeConverter;
  final Function nullConverters;
  final Converter currentConverter;

  ViewModel({this.editConverter, this.deleteConverter, this.changeConverter, this.nullConverters, this.currentConverter });

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
        currentConverter: store.state.currentConverter,
    );
  }
}