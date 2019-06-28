import 'package:exchange_rates_flutter/model/Currency.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';

class GetCurrencies {
 final List<Currency> currencies;

 GetCurrencies(this.currencies);
}

class AddConverter {
 final Converter converter;

 AddConverter(this.converter);
}

class DeleteConverter {
 final int idConverter;

 DeleteConverter(this.idConverter);
}
