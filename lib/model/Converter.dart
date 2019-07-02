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
  double value;
  bool isCurrent;

  Converter(
      {
        this.currency,
        this.value,
        this.isCurrent = false,
      });

//  Converter.fromJson(Map<String, dynamic> json)
//      : currency = Currency.fromJson(json['currency']),
//        value = json['value'],
//        isCurrent = json['isCurrent'];

  factory Converter.fromJson(Map<String, dynamic> json) {
    print(json);
    return Converter(
        currency: Currency.fromJson(json['currency']),
        value: json['value'],
        isCurrent: json['isCurrent'],
    );
  }

  Map<String, dynamic> toJson() => {
    'currency': Currency(id:currency.id, name: currency.name, charCode: currency.charCode, numCode: currency.numCode, nominal: currency.nominal, value: currency.value, previous: currency.previous).toJson(),
    'value': value,
    'isCurrent': isCurrent,
  };

  @override
  String toString() {
    return "$currency: $value, current=$isCurrent";
  }
}