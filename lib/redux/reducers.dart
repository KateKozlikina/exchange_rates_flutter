
import 'package:exchange_rates_flutter/redux/AppState.dart';
import 'package:exchange_rates_flutter/redux/actions.dart';
import 'package:exchange_rates_flutter/model/Currency.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';
import 'package:exchange_rates_flutter/utils/convert.dart';


AppState reducer(AppState state, action) {
  return AppState(
    currencies: currenciesReducer(state.currencies, action),
    converters: convertersReducer(state, action),
    //currentConverter: currentConverterReducer(state.currentConverter, action),
  );
}

List<Currency> currenciesReducer(List<Currency> prev, dynamic action) {
if (action is GetCurrencies) {
    return action.currencies;
  } else {
    return prev;
  }
}

List<Converter> convertersReducer(AppState prevState, dynamic action) {
  List<Converter> newConverters = prevState.converters;

  if (action is AddConverter) {
    if (newConverters.isEmpty) {
      newConverters.add(action.converter);
      return newConverters;
    }

    Converter currentConverter = newConverters.firstWhere((converter)=>converter.isCurrent);
    if(!(containsCurrency(newConverters, action.converter.currency))) {
      newConverters.add(action.converter);
      return convert(value: currentConverter.value,
          convertFrom: currentConverter,
          converters: newConverters);
    } else return prevState.converters;

  } else if(action is DeleteConverter) {
    newConverters.remove(action.converter);
    if (action.converter.isCurrent) {
        newConverters[0].isCurrent = true;
        newConverters = toZero(newConverters);
    }
    return newConverters;

  } else if (action is EditConverter){
    return convert(value: action.value, convertFrom: action.converter, converters: newConverters);

  } else if(action is NullConverters){
    return toZero(newConverters);

  } else if(action is ChangeConverter) {
    return changeCurrentConverter(newConverters, action.converter);

  } else {
    return prevState.converters;
  }
}

//Converter currentConverterReducer(Converter prev, dynamic action) {
//  if (action is ChangeConverter) {
//    return action.converter;
//  } else {
//    return prev;
//  }
//}

List<Converter> toZero(List<Converter> converters) {
  for(Converter converter in converters) {
    converter.value = 0;
  }
  return converters;
}

bool containsCurrency(List<Converter> converters, Currency currency) {
  for(Converter converter in converters) {
    if (converter.currency.id == currency.id)
      return true;
  }
  return false;
}

List<Converter> changeCurrentConverter(List<Converter> converters, Converter currentConverter) {
  for(Converter converter in converters) {
    if (converter.currency.id == converter.currency.id)
      converter.isCurrent = true;
    else
      converter.isCurrent = false;
  }
  return converters;
}