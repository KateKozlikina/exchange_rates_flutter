class Currency {
  final String id;
  final String numCode;
  final String charCode;
  final int nominal;
  final String name;
  final double value;
  final double previous;

  Currency(
      {this.id,
        this.numCode,
        this.charCode,
        this.nominal,
        this.name,
        this.value,
        this.previous});

  Map<String, dynamic> toJson() => {'ID': id, 'NumCode': numCode, 'CharCode': charCode, 'Nominal': nominal, 'Name': name, 'Value': value, 'Previous': previous  };
  factory Currency.fromJson(Map<String, dynamic> json) {
    print(json);
    return Currency(
      id: json['ID'],
      numCode: json['NumCode'],
      charCode: json['CharCode'],
      nominal: json['Nominal'],
      name: json['Name'],
      value: json['Value'],
      previous: json['Previous'],
    );
  }
}