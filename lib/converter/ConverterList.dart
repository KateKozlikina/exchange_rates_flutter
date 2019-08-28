import 'package:flutter/material.dart';
import 'package:exchange_rates_flutter/model/Converter.dart';
import 'package:exchange_rates_flutter/converter/ConverterCard.dart';

class ConverterList extends StatelessWidget {
  final List<Converter> converters;
  ConverterList(this.converters);

  @override
  Widget build(BuildContext context) {
    return new ListView(
        shrinkWrap: true,
        primary: false,
        children: converters.map((converter) {
          Color colorCard = converter.isCurrent ? Colors.red : Colors.black87;
          print(colorCard);
          return new ConverterCard(converter, colorCard);
        }).toList());
  }
}

