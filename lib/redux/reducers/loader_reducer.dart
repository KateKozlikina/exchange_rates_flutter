import 'package:exchange_rates_flutter/redux/actions/loading_actions.dart';

bool loaderReducer(bool prev, dynamic action) {
  if (action is loadingData) {
    return true;
  } else  if (action is notLoadingData) {
    return false;
  } else {
    return prev;
  }
}