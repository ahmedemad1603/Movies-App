/// maximum : "2024-10-23"
/// minimum : "2024-10-02"

class Date
{
  Date({
      this.maximum, 
      this.minimum
  });

  Date.fromJson(dynamic json)
  {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
  String? maximum;
  String? minimum;

  Map<String, dynamic> toJson()
  {
    final map = <String, dynamic>{};
    map['maximum'] = maximum;
    map['minimum'] = minimum;
    return map;
  }

}