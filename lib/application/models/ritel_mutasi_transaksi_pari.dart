class RitelMutasiTransaksiPariModel {
  bool? success;
  Data? data;
  String? message;
  int? code;

  RitelMutasiTransaksiPariModel({
    this.success,
    this.data,
    this.message,
    this.code,
  });

  RitelMutasiTransaksiPariModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['code'] = code;

    return data;
  }
}

class Data {
  Transaksi? transaksi;

  Data({this.transaksi});

  Data.fromJson(Map<String, dynamic> json) {
    transaksi = json['transaksi'] != null
        ? Transaksi.fromJson(json['transaksi'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (transaksi != null) {
      data['transaksi'] = transaksi!.toJson();
    }

    return data;
  }
}

class Transaksi {
  String? prakarsaId;
  String? pathUrl;
  String? gradePari;
  int? totalFrekuensi;
  String? totalNominalFrekuensi;
  String? nilaiRataProject;
  String? nilaiProjectTertinggi;
  List<DataRiwayat>? dataRiwayat;

  Transaksi({
    this.prakarsaId,
    this.pathUrl,
    this.gradePari,
    this.totalFrekuensi,
    this.totalNominalFrekuensi,
    this.nilaiRataProject,
    this.nilaiProjectTertinggi,
    this.dataRiwayat,
  });

  Transaksi.fromJson(Map<String, dynamic> json) {
    prakarsaId = json['prakarsaId'];
    pathUrl = json['pathUrl'];
    gradePari = json['gradePari'];
    totalFrekuensi = json['totalFrekuensi'];
    totalNominalFrekuensi = json['totalNominalFrekuensi'];
    nilaiRataProject = json['nilaiRataProject'];
    nilaiProjectTertinggi = json['nilaiProjectTertinggi'];
    if (json['dataRiwayat'] != null) {
      dataRiwayat = <DataRiwayat>[];
      json['dataRiwayat'].forEach((v) {
        dataRiwayat!.add(DataRiwayat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prakarsaId'] = prakarsaId;
    data['pathUrl'] = pathUrl;
    data['gradePari'] = gradePari;
    data['totalFrekuensi'] = totalFrekuensi;
    data['totalNominalFrekuensi'] = totalNominalFrekuensi;
    data['nilaiRataProject'] = nilaiRataProject;
    data['nilaiProjectTertinggi'] = nilaiProjectTertinggi;
    if (dataRiwayat != null) {
      data['dataRiwayat'] = dataRiwayat!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class DataRiwayat {
  String? transactionDate;
  String? invoiceNum;
  String? nameDebitur;
  String? nameSupplier;
  String? nominalTransaksi;

  DataRiwayat({
    this.transactionDate,
    this.invoiceNum,
    this.nameDebitur,
    this.nameSupplier,
    this.nominalTransaksi,
  });

  DataRiwayat.fromJson(Map<String, dynamic> json) {
    transactionDate = json['transactionDate'];
    invoiceNum = json['invoiceNum'];
    nameDebitur = json['nameDebitur'];
    nameSupplier = json['nameSupplier'];
    nominalTransaksi = json['nominalTransaksi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionDate'] = transactionDate;
    data['invoiceNum'] = invoiceNum;
    data['nameDebitur'] = nameDebitur;
    data['nameSupplier'] = nameSupplier;
    data['nominalTransaksi'] = nominalTransaksi;

    return data;
  }
}
