/// iso_3166_1 : "FR"
/// name : "France"

class ProductionCountry
{
  String? iso31661;
  String? name;

  ProductionCountry({
      this.iso31661, 
      this.name
  });

  ProductionCountry.fromJson(dynamic json)
  {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson()
  {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    return map;
  }

}