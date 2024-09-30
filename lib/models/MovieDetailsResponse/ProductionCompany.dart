/// id : 10163
/// logo_path : "/16KWBMmfPX0aJzDExDrPxSLj0Pg.png"
/// name : "Working Title Films"
/// origin_country : "GB"

class ProductionCompany
{
  num? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompany({
      this.id, 
      this.logoPath, 
      this.name, 
      this.originCountry
  });

  ProductionCompany.fromJson(dynamic json)
  {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson()
  {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logo_path'] = logoPath;
    map['name'] = name;
    map['origin_country'] = originCountry;
    return map;
  }

}