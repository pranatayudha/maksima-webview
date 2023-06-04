// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, newline-before-return

class RitelPrakarsaPeroranganDataDiriPariTwo {
  String? prakarsaId;
  String? id;
  String? idAccountPari;
  String? pipelineFlagId;
  String? ktpNum;
  String? kkNum;
  int? numberOfDependents;
  String? lastEducation;
  String? dateOfExpiredKTP;
  String? dateOfIssuedKTP;
  String? religion;
  String? npwpNum;
  String? fullName;
  String? gender;
  DateOfBirth? dateOfBirth;
  String? placeOfBirth;
  String? motherMaiden;
  String? maritalStatus;
  String? phoneNum;
  String? email;
  String? spouseKtpNum;
  String? spouseFullname;
  DateOfBirth? spouseDateOfBirth;
  String? spousePlaceOfBirth;
  String? ktpPath;
  String? npwpPath;
  String? ktpSelfiePath;
  String? spouseKtpPath;
  String? kkPath;
  String? marriagePath;
  String? divorcePath;
  String? deathCertificatePath;
  TagLocation? tagLocation;
  String? detail;
  String? postalCode;
  String? province;
  String? city;
  String? district;
  String? village;
  String? rt;
  String? rw;
  String? createdAt;
  String? createdBy;
  String? typePipeline;
  String? initial;

  RitelPrakarsaPeroranganDataDiriPariTwo({
    this.prakarsaId,
    this.id,
    this.idAccountPari,
    this.pipelineFlagId,
    this.ktpNum,
    this.kkNum,
    this.numberOfDependents,
    this.lastEducation,
    this.dateOfExpiredKTP,
    this.dateOfIssuedKTP,
    this.religion,
    this.npwpNum,
    this.fullName,
    this.gender,
    this.dateOfBirth,
    this.placeOfBirth,
    this.motherMaiden,
    this.maritalStatus,
    this.phoneNum,
    this.email,
    this.spouseKtpNum,
    this.spouseFullname,
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
    this.tagLocation,
    this.detail,
    this.postalCode,
    this.province,
    this.city,
    this.district,
    this.village,
    this.rt,
    this.rw,
    this.createdAt,
    this.createdBy,
    this.typePipeline,
    this.initial,
  });

  RitelPrakarsaPeroranganDataDiriPariTwo.fromJson(Map<String, dynamic> json) {
    prakarsaId = json['prakarsaId'];
    id = json['id'];
    idAccountPari = json['idAccountPari'];
    pipelineFlagId = json['pipeline_flagId'];
    ktpNum = json['ktpNum'];
    kkNum = json['kkNum'];
    numberOfDependents = json['numberOfDependents'];
    lastEducation = json['lastEducation'];
    dateOfExpiredKTP = json['dateOfExpiredKTP'];
    dateOfIssuedKTP = json['dateOfIssuedKTP'];
    religion = json['religion'];
    npwpNum = json['npwpNum'];
    fullName = json['fullName'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'] != null
        ? new DateOfBirth.fromJson(json['dateOfBirth'])
        : null;
    placeOfBirth = json['placeOfBirth'];
    motherMaiden = json['motherMaiden'];
    maritalStatus = json['maritalStatus'];
    phoneNum = json['phoneNum'];
    email = json['email'];
    spouseKtpNum = json['spouseKtpNum'];
    spouseFullname = json['spouseFullname'];
    spouseDateOfBirth = json['spouseDateOfBirth'] != null
        ? new DateOfBirth.fromJson(json['spouseDateOfBirth'])
        : null;
    spousePlaceOfBirth = json['spousePlaceOfBirth'];
    ktpPath = json['ktpPath'];
    npwpPath = json['npwpPath'];
    ktpSelfiePath = json['ktpSelfiePath'];
    spouseKtpPath = json['spouseKtpPath'];
    kkPath = json['kkPath'];
    marriagePath = json['marriagePath'];
    divorcePath = json['divorcePath'];
    deathCertificatePath = json['deathCertificatePath'];
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
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    typePipeline = json['typePipeline'];
    initial = json['initial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prakarsaId'] = this.prakarsaId;
    data['id'] = this.id;
    data['idAccountPari'] = this.idAccountPari;
    data['pipeline_flagId'] = this.pipelineFlagId;
    data['ktpNum'] = this.ktpNum;
    data['kkNum'] = this.kkNum;
    data['numberOfDependents'] = this.numberOfDependents;
    data['lastEducation'] = this.lastEducation;
    data['dateOfExpiredKTP'] = this.dateOfExpiredKTP;
    data['dateOfIssuedKTP'] = this.dateOfIssuedKTP;
    data['religion'] = this.religion;
    data['npwpNum'] = this.npwpNum;
    data['fullName'] = this.fullName;
    data['gender'] = this.gender;
    if (this.dateOfBirth != null) {
      data['dateOfBirth'] = this.dateOfBirth!.toJson();
    }
    data['placeOfBirth'] = this.placeOfBirth;
    data['motherMaiden'] = this.motherMaiden;
    data['maritalStatus'] = this.maritalStatus;
    data['phoneNum'] = this.phoneNum;
    data['email'] = this.email;
    data['spouseKtpNum'] = this.spouseKtpNum;
    data['spouseFullname'] = this.spouseFullname;
    if (this.spouseDateOfBirth != null) {
      data['spouseDateOfBirth'] = this.spouseDateOfBirth!.toJson();
    }
    data['spousePlaceOfBirth'] = this.spousePlaceOfBirth;
    data['ktpPath'] = this.ktpPath;
    data['npwpPath'] = this.npwpPath;
    data['ktpSelfiePath'] = this.ktpSelfiePath;
    data['spouseKtpPath'] = this.spouseKtpPath;
    data['kkPath'] = this.kkPath;
    data['marriagePath'] = this.marriagePath;
    data['divorcePath'] = this.divorcePath;
    data['deathCertificatePath'] = this.deathCertificatePath;
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
    data['createdAt'] = this.createdAt;
    data['createdBy'] = this.createdBy;
    data['typePipeline'] = this.typePipeline;
    data['initial'] = this.initial;
    return data;
  }
}

class DateOfBirth {
  String? date;
  String? newDate;

  DateOfBirth({this.date, this.newDate});

  DateOfBirth.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    newDate = json['newDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['newDate'] = this.newDate;
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
