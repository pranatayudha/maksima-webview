// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class RitelInformasiPengurusPTTwo {
  String? ptPipelinesId;
  String? jobCode;
  String? ktpNum;
  String? npwpNum;
  String? fullName;
  String? gender;
  String? dateOfBirth;
  String? placeOfBirth;
  String? phoneNum;
  String? email;
  int? sharePercentage;
  int? shares;
  String? shareNominal;
  String? ktpPath;
  String? npwpPath;
  TagLocation? tagLocation;
  String? detail;
  String? postalCode;
  String? province;
  String? city;
  String? district;
  String? village;
  String? rt;
  String? rw;

  RitelInformasiPengurusPTTwo({
    this.ptPipelinesId,
    this.jobCode,
    this.ktpNum,
    this.npwpNum,
    this.fullName,
    this.gender,
    this.dateOfBirth,
    this.placeOfBirth,
    this.phoneNum,
    this.email,
    this.sharePercentage,
    this.shares,
    this.shareNominal,
    this.ktpPath,
    this.npwpPath,
    this.tagLocation,
    this.detail,
    this.postalCode,
    this.province,
    this.city,
    this.district,
    this.village,
    this.rt,
    this.rw,
  });

  RitelInformasiPengurusPTTwo.fromJson(Map<String, dynamic> json) {
    ptPipelinesId = json['pt_pipelinesId'];
    jobCode = json['jobCode'];
    ktpNum = json['ktpNum'];
    npwpNum = json['npwpNum'];
    fullName = json['fullName'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    placeOfBirth = json['placeOfBirth'];
    phoneNum = json['phoneNum'];
    email = json['email'];
    sharePercentage = json['sharePercentage'];
    shares = json['shares'];
    shareNominal = json['shareNominal'];
    ktpPath = json['ktpPath'];
    npwpPath = json['npwpPath'];
    tagLocation = json['tagLocation'] != null
        ? new TagLocation.fromJson(json['tagLocation'])
        : null;
    detail = json['detail'];
    postalCode = json['postalCode'];
    province = json['province'];
    city = json['city'];
    district = json['district'];
    village = json['village'];
    rt = json['rt'];
    rw = json['rw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pt_pipelinesId'] = this.ptPipelinesId;
    data['jobCode'] = this.jobCode;
    data['ktpNum'] = this.ktpNum;
    data['npwpNum'] = this.npwpNum;
    data['fullName'] = this.fullName;
    data['gender'] = this.gender;
    data['dateOfBirth'] = this.dateOfBirth;
    data['placeOfBirth'] = this.placeOfBirth;
    data['phoneNum'] = this.phoneNum;
    data['email'] = this.email;
    data['sharePercentage'] = this.sharePercentage;
    data['shares'] = this.shares;
    data['shareNominal'] = this.shareNominal;
    data['ktpPath'] = this.ktpPath;
    data['npwpPath'] = this.npwpPath;
    if (this.tagLocation != null) {
      data['tagLocation'] = this.tagLocation!.toJson();
    }
    data['detail'] = this.detail;
    data['postalCode'] = this.postalCode;
    data['province'] = this.province;
    data['city'] = this.city;
    data['district'] = this.district;
    data['village'] = this.village;
    data['rt'] = this.rt;
    data['rw'] = this.rw;

    return data;
  }
}

class TagLocation {
  String? latLng;
  String? name;

  TagLocation({this.latLng, this.name});

  TagLocation.fromJson(Map<String, dynamic> json) {
    latLng = json['latLng'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latLng'] = this.latLng;
    data['name'] = this.name;

    return data;
  }
}