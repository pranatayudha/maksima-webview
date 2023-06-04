// ignore_for_file: unnecessary_new, unnecessary_this, prefer_collection_literals, non_constant_identifier_names

class RitelInformasiPerusahaanPt {
  String? id;
  String? pipeline_flagId;
  String? companyName;
  String? companyNpwpNum;
  String? economy_sectorsId;
  String? economySectorsName;
  String? economy_sub_sectorsId;
  String? economySubSectorsName;
  String? partnershipsId;
  DateOfDeedEst? dateOfDeedEst;
  String? deedEstNum;
  DateOfDeedEst? dateOfSkKumham;
  String? skKumhamNum;
  DateOfDeedEst? latestDateOfDeed;
  String? latestDeedNum;
  DateOfDeedEst? latestDateOfSkKumham;
  String? latestSkKumhamNum;
  String? fullnamePIC;
  String? phoneNumPIC;
  String? emailPIC;
  String? companyNpwpPath;
  String? deedEstPath;
  String? latestDeedPath;
  String? skKumhamPath;
  String? latestSkKumhamPath;
  String? placeOfDeedEst;
  String? latestPlaceOfDeed;
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

  RitelInformasiPerusahaanPt({
    this.id,
    this.pipeline_flagId,
    this.companyName,
    this.companyNpwpNum,
    this.economy_sectorsId,
    this.economySectorsName,
    this.economy_sub_sectorsId,
    this.economySubSectorsName,
    this.partnershipsId,
    this.dateOfDeedEst,
    this.deedEstNum,
    this.dateOfSkKumham,
    this.skKumhamNum,
    this.latestDateOfDeed,
    this.latestDeedNum,
    this.latestDateOfSkKumham,
    this.latestSkKumhamNum,
    this.fullnamePIC,
    this.phoneNumPIC,
    this.emailPIC,
    this.companyNpwpPath,
    this.deedEstPath,
    this.latestDeedPath,
    this.skKumhamPath,
    this.latestSkKumhamPath,
    this.placeOfDeedEst,
    this.latestPlaceOfDeed,
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

  RitelInformasiPerusahaanPt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pipeline_flagId = json['pipeline_flagId'];
    companyName = json['companyName'];
    companyNpwpNum = json['companyNpwpNum'];
    economy_sectorsId = json['economy_sectorsId'];
    economySectorsName = json['economySectorsName'];
    economy_sub_sectorsId = json['economy_sub_sectorsId'];
    economySubSectorsName = json['economySubSectorsName'];
    partnershipsId = json['partnershipsId'];
    dateOfDeedEst = json['dateOfDeedEst'] != null
        ? new DateOfDeedEst.fromJson(json['dateOfDeedEst'])
        : null;
    deedEstNum = json['deedEstNum'];
    dateOfSkKumham = json['dateOfSkKumham'] != null
        ? new DateOfDeedEst.fromJson(json['dateOfSkKumham'])
        : null;
    skKumhamNum = json['skKumhamNum'];
    latestDateOfDeed = json['latestDateOfDeed'] != null
        ? new DateOfDeedEst.fromJson(json['latestDateOfDeed'])
        : null;
    latestDeedNum = json['latestDeedNum'];
    latestDateOfSkKumham = json['latestDateOfSkKumham'] != null
        ? new DateOfDeedEst.fromJson(json['latestDateOfSkKumham'])
        : null;
    latestSkKumhamNum = json['latestSkKumhamNum'];
    fullnamePIC = json['fullnamePIC'];
    phoneNumPIC = json['phoneNumPIC'];
    emailPIC = json['emailPIC'];
    companyNpwpPath = json['companyNpwpPath'];
    deedEstPath = json['deedEstPath'];
    latestDeedPath = json['latestDeedPath'];
    skKumhamPath = json['skKumhamPath'];
    latestSkKumhamPath = json['latestSkKumhamPath'];
    placeOfDeedEst = json['placeOfDeedEst'];
    latestPlaceOfDeed = json['latestPlaceOfDeed'];
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
    data['id'] = this.id;
    data['pipeline_flagId'] = this.pipeline_flagId;
    data['companyName'] = this.companyName;
    data['companyNpwpNum'] = this.companyNpwpNum;
    data['economy_sectorsId'] = this.economy_sectorsId;
    data['economySectorsName'] = this.economySectorsName;
    data['economy_sub_sectorsId'] = this.economy_sub_sectorsId;
    data['economySubSectorsName'] = this.economySubSectorsName;
    data['partnershipsId'] = this.partnershipsId;
    if (this.dateOfDeedEst != null) {
      data['dateOfDeedEst'] = this.dateOfDeedEst!.toJson();
    }
    data['deedEstNum'] = this.deedEstNum;
    if (this.dateOfSkKumham != null) {
      data['dateOfSkKumham'] = this.dateOfSkKumham!.toJson();
    }
    data['skKumhamNum'] = this.skKumhamNum;
    if (this.latestDateOfDeed != null) {
      data['latestDateOfDeed'] = this.latestDateOfDeed!.toJson();
    }
    data['latestDeedNum'] = this.latestDeedNum;
    if (this.latestDateOfSkKumham != null) {
      data['latestDateOfSkKumham'] = this.latestDateOfSkKumham!.toJson();
    }
    data['latestSkKumhamNum'] = this.latestSkKumhamNum;
    data['fullnamePIC'] = this.fullnamePIC;
    data['phoneNumPIC'] = this.phoneNumPIC;
    data['emailPIC'] = this.emailPIC;
    data['companyNpwpPath'] = this.companyNpwpPath;
    data['deedEstPath'] = this.deedEstPath;
    data['latestDeedPath'] = this.latestDeedPath;
    data['skKumhamPath'] = this.skKumhamPath;
    data['latestSkKumhamPath'] = this.latestSkKumhamPath;
    data['placeOfDeedEst'] = this.placeOfDeedEst;
    data['latestPlaceOfDeed'] = this.latestPlaceOfDeed;
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

class DateOfDeedEst {
  String? date;
  String? newDate;

  DateOfDeedEst({this.date, this.newDate});

  DateOfDeedEst.fromJson(Map<String, dynamic> json) {
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
