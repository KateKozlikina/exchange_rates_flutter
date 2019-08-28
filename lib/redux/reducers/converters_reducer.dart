import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/redux/actions/converter_actions.dart';

import 'package:exchange_rates_flutter/model/Converter.dart';

import 'package:exchange_rates_flutter/utils/converter_utils/convert.dart';
import 'package:exchange_rates_flutter/utils/converter_utils/containsCurrency.dart';
import 'package:exchange_rates_flutter/utils/converter_utils/toZero.dart';
import 'package:exchange_rates_flutter/utils/converter_utils/changeCurrentConverter.dart';
import 'package:exchange_rates_flutter/utils/preference_utils/saveConvertersToPref.dart';

List<Converter> convertersReducer(AppState prevState, dynamic action) {
  List<Converter> newConverters = prevState.converters;

  if (action is AddConverter) {
    if (newConverters.isEmpty) {
      newConverters.add(action.converter);
      saveConvertersToPref(newConverters);
      return newConverters;
    }

    Converter currentConverter = newConverters.firstWhere((converter)=>converter.isCurrent);
    if(!(containsCurrency(newConverters, action.converter.currency))) {
      newConverters.add(action.converter);
      return convert(
          value: currentConverter.value,
          convertFrom: currentConverter,
          converters: newConverters
      );
    } else return prevState.converters;

  } else if(action is DeleteConverter) {
    newConverters.remove(action.converter);
    if (action.converter.isCurrent) {
      newConverters[0].isCurrent = true;
      newConverters = toZero(newConverters);
      return newConverters;
    }
    saveConvertersToPref(newConverters);
    return newConverters;

  } else if (action is EditConverter){
    return convert(value: action.value, convertFrom: action.converter, converters: newConverters);

  } else if(action is NullConverters){
    return toZero(newConverters);

  } else if(action is ChangeConverter) {
    return changeCurrentConverter(newConverters, action.converter);

  } else if(action is LoadConverter) {
    return action.converters;

  } else {
    return prevState.converters;
  }
}
