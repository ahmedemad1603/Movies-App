/// english_name : "English"
/// iso_639_1 : "en"
/// name : "English"

class SpokenLanguage
{
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguage({
      this.englishName, 
      this.iso6391, 
      this.name
  });

  SpokenLanguage.fromJson(dynamic json)
  {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson()
  {
    final map = <String, dynamic>{};
    map['english_name'] = englishName;
    map['iso_639_1'] = iso6391;
    map['name'] = name;
    return map;
  }

}