// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, newline-before-return

class RitelRiwayatProjek {
  String? prakarsaId;
  String? pathRiwayatProject;
  String? namePath;
  String? nilaiRataProject;
  String? nilaiProjectTertinggi;
  List<DataRiwayat>? dataRiwayat;

  RitelRiwayatProjek({
    this.prakarsaId,
    this.pathRiwayatProject,
    this.namePath,
    this.nilaiRataProject,
    this.nilaiProjectTertinggi,
    this.dataRiwayat,
  });

  RitelRiwayatProjek.fromJson(Map<String, dynamic> json) {
    prakarsaId = json['prakarsaId'];
    pathRiwayatProject = json['pathRiwayatProject'];
    namePath = json['namePath'];
    nilaiRataProject = json['nilaiRataProject'];
    nilaiProjectTertinggi = json['nilaiProjectTertinggi'];
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
    data['nilaiProjectTertinggi'] = this.nilaiProjectTertinggi;
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
