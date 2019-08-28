import 'package:exchange_rates_flutter/model/Converter.dart';

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

class LoadConverter {
  final List<Converter> converters;

  LoadConverter(this.converters);
}

class NullConverters {}