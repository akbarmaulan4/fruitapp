
class FruitModel{
  FruitModel(){}
  String? name;
  int? price;

  factory FruitModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);
}

FruitModel _$fromJson(Map<String, dynamic> json) {
  return FruitModel()
    ..name = json['name'] ?? ''
    ..price = json['price'] ?? 0
  ;
}

Map<String, dynamic> _$toJson(FruitModel instance) =>
    <String, dynamic> {
      'name': instance.name,
      'price': instance.price,
    };