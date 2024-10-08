/// id : 18
/// name : "Drama"

class Genre
{
  num? id;
  String? name;

  Genre({
      this.id, 
      this.name,});

  Genre.fromJson(dynamic json)
  {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson()
  {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}