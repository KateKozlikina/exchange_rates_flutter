import 'package:exchange_rates_flutter/model/Currency.dart';

//class Converter {
//  final int id;
//  final Currency currencyFrom;
//  final Currency currencyTo;
//  final double convertFrom;
//  final double convertTo;
//
//  Converter(
//      {this.id,
//        this.currencyFrom,
//        this.currencyTo,
//        this.convertFrom,
//        this.convertTo,
//      });
//}

class Converter {
  final Currency currency;
  final double value;

  Converter(
      {
        this.currency,
        this.value,
      });
}