// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class PlaceOfBirth {
  String? city;

  PlaceOfBirth({this.city});

  PlaceOfBirth.fromJson(Map<String, dynamic> json) {
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;

    return data;
  }
}
