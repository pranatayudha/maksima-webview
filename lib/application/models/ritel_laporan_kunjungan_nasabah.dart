// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals, non_constant_identifier_names

class RitelLaporanKunjunganNasabah {
  String? name;
  DataLkn? dataLkn;
  String? status;

  RitelLaporanKunjunganNasabah({this.name, this.dataLkn, this.status});

  RitelLaporanKunjunganNasabah.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dataLkn =
        json['dataLkn'] != null ? new DataLkn.fromJson(json['dataLkn']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.dataLkn != null) {
      data['dataLkn'] = this.dataLkn!.toJson();
    }
    data['status'] = this.status;

    return data;
  }
}

class DataLkn {
  String? prakarsaId;
  String? id;
  String? cbName;
  String? pipelinesId;
  int? codeTable;
  String? community_branchesId;
  String? etaToCB;
  String? loan_typesId;
  String? loanAmount;
  TagLocation? tagLocation;
  String? dateOfVisit;
  String? visitResult;
  List<VisitPath>? visitPath;
  String? purposeVisit;
  String? ratingPARI;
  String? frekuensiTransaksi;

  List<String>? pathFotoAgunanTambahan;

  DataLkn({
    this.prakarsaId,
    this.id,
    this.pipelinesId,
    this.codeTable,
    this.community_branchesId,
    this.cbName,
    this.etaToCB,
    this.loan_typesId,
    this.loanAmount,
    this.tagLocation,
    this.dateOfVisit,
    this.visitResult,
    this.visitPath,
    this.purposeVisit,
    this.ratingPARI,
    this.frekuensiTransaksi,
  });

  DataLkn.fromJson(Map<String, dynamic> json) {
    prakarsaId = json['prakarsaId'];
    id = json['id'];
    pipelinesId = json['pipelinesId'];
    codeTable = json['codeTable'];
    community_branchesId = json['community_branchesId'];
    cbName = json['cbName'];
    etaToCB = json['etaToCB'];
    loan_typesId = json['loan_typesId'];
    purposeVisit = json['purposeVisit'];
    ratingPARI = json['ratingPARI'];
    frekuensiTransaksi = json['transactionFrequency'];

    loanAmount = json['loanAmount'];
    tagLocation = json['tagLocation'] != null
        ? new TagLocation.fromJson(json['tagLocation'])
        : null;
    dateOfVisit = json['dateOfVisit'];
    visitResult = json['visitResult'];
    if (json['visitPath'] != null) {
      visitPath = <VisitPath>[];
      json['visitPath'].forEach((v) {
        visitPath!.add(new VisitPath.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prakarsaId'] = this.prakarsaId;
    data['id'] = this.id;
    data['pipelinesId'] = this.pipelinesId;
    data['codeTable'] = this.codeTable;
    data['community_branchesId'] = this.community_branchesId;
    data['cbName'] = this.cbName;
    data['etaToCB'] = this.etaToCB;
    data['loan_typesId'] = this.loan_typesId;
    data['loanAmount'] = this.loanAmount;
    if (this.tagLocation != null) {
      data['tagLocation'] = this.tagLocation!.toJson();
    }
    data['dateOfVisit'] = this.dateOfVisit;
    data['visitResult'] = this.visitResult;
    if (this.visitPath != null) {
      data['visitPath'] = this.visitPath!.map((v) => v.toJson()).toList();
    }
    data['purposeVisit'] = this.purposeVisit;
    data['ratingPARI'] = this.ratingPARI;
    data['transactionFrequency'] = this.frekuensiTransaksi;

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

class VisitPath {
  String? path;
  Meta? meta;

  VisitPath({this.path, this.meta});

  VisitPath.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }

    return data;
  }
}

class Meta {
  String? photoName;
  String? locationDetail;

  Meta({this.photoName, this.locationDetail});

  Meta.fromJson(Map<String, dynamic> json) {
    photoName = json['photoName'];
    locationDetail = json['locationDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photoName'] = this.photoName;
    data['locationDetail'] = this.locationDetail;

    return data;
  }
}
