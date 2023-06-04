// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, newline-before-return

class RitelPostalCode {
  String? provinceCode;
  String? province;
  String? cityCode;
  String? city;
  String? districtCode;
  String? district;
  String? villageCode;
  String? village;
  String? postalCode;

  RitelPostalCode({
    this.provinceCode,
    this.province,
    this.cityCode,
    this.city,
    this.districtCode,
    this.district,
    this.villageCode,
    this.village,
    this.postalCode,
  });

  RitelPostalCode.fromJson(Map<String, dynamic> json) {
    provinceCode = json['provinceCode'];
    province = json['province'];
    cityCode = json['cityCode'];
    city = json['city'];
    districtCode = json['districtCode'];
    district = json['district'];
    villageCode = json['villageCode'];
    village = json['village'];
    postalCode = json['postalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provinceCode'] = this.provinceCode;
    data['province'] = this.province;
    data['cityCode'] = this.cityCode;
    data['city'] = this.city;
    data['districtCode'] = this.districtCode;
    data['district'] = this.district;
    data['villageCode'] = this.villageCode;
    data['village'] = this.village;
    data['postalCode'] = this.postalCode;
    return data;
  }
}
