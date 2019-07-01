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
 final Converter converter;

 DeleteConverter(this.converter);
}

class EditConverter {
 final Converter converter;
 double value;

 EditConverter(this.value, this.converter);
}

class ChangeConverter {
 final Converter converter;

 ChangeConverter(this.converter);
}

class NullConverters {}