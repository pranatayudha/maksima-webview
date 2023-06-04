// ignore_for_file: unnecessary_this, prefer_collection_literals, unnecessary_new

class RitelListInformasiPengurusPemilikCV {
  String? id;
  String? cvPipelinesId;
  String? ktpNum;
  String? npwpNum;
  String? fullName;
  String? gender;
  String? dateOfBirth;
  String? placeOfBirth;
  String? maritalStatus;
  TagLocation? tagLocation;
  String? detail;
  String? postalCode;
  String? province;
  String? city;
  String? district;
  String? village;
  String? rt;
  String? rw;
  String? phoneNum;
  String? email;
  String? spouseFullname;
  String? spouseKtpNum;
  String? spouseDateOfBirth;
  String? spousePlaceOfBirth;
  String? ktpPath;
  String? npwpPath;
  String? ktpSelfiePath;
  String? spouseKtpPath;
  String? kkPath;
  String? marriagePath;
  String? divorcePath;
  String? deathCertificatePath;
  String? createdAt;
  String? createdBy;
  int? jobCode;

  RitelListInformasiPengurusPemilikCV({
    this.id,
    this.cvPipelinesId,
    this.ktpNum,
    this.npwpNum,
    this.fullName,
    this.gender,
    this.dateOfBirth,
    this.placeOfBirth,
    this.maritalStatus,
    this.tagLocation,
    this.detail,
    this.postalCode,
    this.province,
    this.city,
    this.district,
    this.village,
    this.rt,
    this.rw,
    this.phoneNum,
    this.email,
    this.spouseFullname,
    this.spouseKtpNum,
    this.spouseDateOfBirth,
    this.spousePlaceOfBirth,
    this.ktpPath,
    this.npwpPath,
    this.ktpSelfiePath,
    this.spouseKtpPath,
    this.kkPath,
    this.marriagePath,
    this.divorcePath,
    this.deathCertificatePath,
    this.createdAt,
    this.createdBy,
    this.jobCode,
  });

  RitelListInformasiPengurusPemilikCV.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cvPipelinesId = json['cv_pipelinesId'];
    ktpNum = json['ktpNum'];
    npwpNum = json['npwpNum'];
    fullName = json['fullName'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    placeOfBirth = json['placeOfBirth'];
    maritalStatus = json['maritalStatus'];
    tagLocation = json['tagLocation'] != null
        ? TagLocation.fromJson(json['tagLocation'])
        : null;
    detail = json['detail'];
    postalCode = json['postalCode'];
    province = json['province'];
    city = json['city'];
    district = json['district'];
    village = json['village'];
    rt = json['rt'];
    rw = json['rw'];
    phoneNum = json['phoneNum'];
    email = json['email'];
    spouseFullname = json['spouseFullname'];
    spouseKtpNum = json['spouseKtpNum'];
    spouseDateOfBirth = json['spouseDateOfBirth'];
    spousePlaceOfBirth = json['spousePlaceOfBirth'];
    ktpPath = json['ktpPath'];
    npwpPath = json['npwpPath'];
    ktpSelfiePath = json['ktpSelfiePath'];
    spouseKtpPath = json['spouseKtpPath'];
    kkPath = json['kkPath'];
    marriagePath = json['marriagePath'];
    divorcePath = json['divorcePath'];
    deathCertificatePath = json['deathCertificatePath'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    jobCode = json['jobCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cv_pipelinesId'] = this.cvPipelinesId;
    data['ktpNum'] = this.ktpNum;
    data['npwpNum'] = this.npwpNum;
    data['fullName'] = this.fullName;
    data['gender'] = this.gender;
    data['dateOfBirth'] = this.dateOfBirth;
    data['placeOfBirth'] = this.placeOfBirth;
    data['maritalStatus'] = this.maritalStatus;
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
    data['phoneNum'] = this.phoneNum;
    data['email'] = this.email;
    data['spouseFullname'] = this.spouseFullname;
    data['spouseKtpNum'] = this.spouseKtpNum;
    data['spouseDateOfBirth'] = this.spouseDateOfBirth;
    data['spousePlaceOfBirth'] = this.spousePlaceOfBirth;
    data['ktpPath'] = this.ktpPath;
    data['npwpPath'] = this.npwpPath;
    data['ktpSelfiePath'] = this.ktpSelfiePath;
    data['spouseKtpPath'] = this.spouseKtpPath;
    data['kkPath'] = this.kkPath;
    data['marriagePath'] = this.marriagePath;
    data['divorcePath'] = this.divorcePath;
    data['deathCertificatePath'] = this.deathCertificatePath;
    data['createdAt'] = this.createdAt;
    data['createdBy'] = this.createdBy;
    data['jobCode'] = this.jobCode;
    // ignore: newline-before-return
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
    // ignore: newline-before-return
    return data;
  }
}
