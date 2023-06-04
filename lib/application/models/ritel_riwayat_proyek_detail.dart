// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, newline-before-return

class RitelRiwayatProjekDetails {
  bool? success;
  Data? data;
  DataRiwayat? dataRiwayat;

  String? message;
  int? code;

  RitelRiwayatProjekDetails({this.success, this.data, this.message, this.code});

  RitelRiwayatProjekDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  String? prakarsaId;
  String? pathRiwayatProject;
  String? namePath;
  String? nilaiRataProject;
  List<DataRiwayat>? dataRiwayat;

  Data({
    this.prakarsaId,
    this.pathRiwayatProject,
    this.namePath,
    this.nilaiRataProject,
    this.dataRiwayat,
  });

  Data.fromJson(Map<String, dynamic> json) {
    prakarsaId = json['prakarsaId'];
    pathRiwayatProject = json['pathRiwayatProject'];
    namePath = json['namePath'];
    nilaiRataProject = json['nilaiRataProject'];
    if (json['dataRiwayat'] != null) {
      dataRiwayat = <DataRiwayat>[];
      json['dataRiwayat'].forEach((v) {
        dataRiwayat!.add(new DataRiwayat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prakarsaId'] = this.prakarsaId;
    data['pathRiwayatProject'] = this.pathRiwayatProject;
    data['namePath'] = this.namePath;
    data['nilaiRataProject'] = this.nilaiRataProject;
    if (this.dataRiwayat != null) {
      data['dataRiwayat'] = this.dataRiwayat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataRiwayat {
  String? spkInvoice;
  String? numSpkInvoice;
  String? konsumen;
  String? namaPekerjaan;
  String? nilaiInvoice;
  int? periodeProyek;
  String? statusProyek;

  DataRiwayat({
    this.spkInvoice,
    this.numSpkInvoice,
    this.konsumen,
    this.namaPekerjaan,
    this.nilaiInvoice,
    this.periodeProyek,
    this.statusProyek,
  });

  DataRiwayat.fromJson(Map<String, dynamic> json) {
    spkInvoice = json['spkInvoice'];
    numSpkInvoice = json['numSpkInvoice'];
    konsumen = json['konsumen'];
    namaPekerjaan = json['namaPekerjaan'];
    nilaiInvoice = json['nilaiInvoice'];
    periodeProyek = json['periodeProyek'];
    statusProyek = json['statusProyek'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spkInvoice'] = this.spkInvoice;
    data['numSpkInvoice'] = this.numSpkInvoice;
    data['konsumen'] = this.konsumen;
    data['namaPekerjaan'] = this.namaPekerjaan;
    data['nilaiInvoice'] = this.nilaiInvoice;
    data['periodeProyek'] = this.periodeProyek;
    data['statusProyek'] = this.statusProyek;
    return data;
  }
}
