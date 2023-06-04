// ignore_for_file: prefer_collection_literals, unnecessary_this

class RitelMutasiRekeningKoran {
  bool? success;
  Data? data;
  String? message;
  int? code;

  RitelMutasiRekeningKoran({this.success, this.data, this.message, this.code});

  RitelMutasiRekeningKoran.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    // ignore: newline-before-return
    return data;
  }
}

class Data {
  Header? header;
  List<Body>? body;

  Data({this.header, this.body});

  Data.fromJson(Map<String, dynamic> json) {
    header = json['header'] != null ? Header.fromJson(json['header']) : null;
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(Body.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.header != null) {
      data['header'] = this.header!.toJson();
    }
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    // ignore: newline-before-return
    return data;
  }
}

class Header {
  String? prakarsaId;
  String? periode;
  String? totalMutasiKredit;
  String? ratasMutasiKredit;
  String? totalMutasiDebet;
  String? ratasMutasiDebet;
  String? totalSaldoAKhir;

  Header({
    this.prakarsaId,
    this.periode,
    this.totalMutasiKredit,
    this.ratasMutasiKredit,
    this.totalMutasiDebet,
    this.ratasMutasiDebet,
    this.totalSaldoAKhir,
  });

  Header.fromJson(Map<String, dynamic> json) {
    prakarsaId = json['prakarsaId'];
    periode = json['periode'];
    totalMutasiKredit = json['totalMutasiKredit'];
    ratasMutasiKredit = json['ratasMutasiKredit'];
    totalMutasiDebet = json['totalMutasiDebet'];
    ratasMutasiDebet = json['ratasMutasiDebet'];
    totalSaldoAKhir = json['totalSaldoAKhir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['prakarsaId'] = this.prakarsaId;
    data['periode'] = this.periode;
    data['totalMutasiKredit'] = this.totalMutasiKredit;
    data['ratasMutasiKredit'] = this.ratasMutasiKredit;
    data['totalMutasiDebet'] = this.totalMutasiDebet;
    data['ratasMutasiDebet'] = this.ratasMutasiDebet;
    data['totalSaldoAKhir'] = this.totalSaldoAKhir;
    // ignore: newline-before-return
    return data;
  }
}

class Body {
  String? id;
  String? prakarsaId;
  String? bank;
  String? namaBank;
  String? noRekening;
  int? totalMonth;
  String? periode;
  String? totalMutasiKredit;
  String? ratasMutasiKredit;
  String? totalMutasiDebet;
  String? ratasMutasiDebet;
  String? totalSaldoAKhir;
  List<DetailMutasi>? detailMutasi;

  Body({
    this.id,
    this.prakarsaId,
    this.bank,
    this.namaBank,
    this.noRekening,
    this.totalMonth,
    this.periode,
    this.totalMutasiKredit,
    this.ratasMutasiKredit,
    this.totalMutasiDebet,
    this.ratasMutasiDebet,
    this.totalSaldoAKhir,
    this.detailMutasi,
  });

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    prakarsaId = json['prakarsaId'];
    bank = json['bank'];
    namaBank = json['namaBank'];
    noRekening = json['noRekening'];
    totalMonth = json['totalMonth'];
    periode = json['periode'];
    totalMutasiKredit = json['totalMutasiKredit'];
    ratasMutasiKredit = json['ratasMutasiKredit'];
    totalMutasiDebet = json['totalMutasiDebet'];
    ratasMutasiDebet = json['ratasMutasiDebet'];
    totalSaldoAKhir = json['totalSaldoAKhir'];
    if (json['detailMutasi'] != null) {
      detailMutasi = <DetailMutasi>[];
      json['detailMutasi'].forEach((v) {
        detailMutasi!.add(DetailMutasi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['prakarsaId'] = this.prakarsaId;
    data['bank'] = this.bank;
    data['namaBank'] = this.namaBank;
    data['noRekening'] = this.noRekening;
    data['totalMonth'] = this.totalMonth;
    data['periode'] = this.periode;
    data['totalMutasiKredit'] = this.totalMutasiKredit;
    data['ratasMutasiKredit'] = this.ratasMutasiKredit;
    data['totalMutasiDebet'] = this.totalMutasiDebet;
    data['ratasMutasiDebet'] = this.ratasMutasiDebet;
    data['totalSaldoAKhir'] = this.totalSaldoAKhir;
    if (this.detailMutasi != null) {
      data['detailMutasi'] = this.detailMutasi!.map((v) => v.toJson()).toList();
    }
    // ignore: newline-before-return
    return data;
  }
}

class DetailMutasi {
  String? id;
  String? mutasiRekeningId;
  String? periodeAwal;
  String? periodeAkhir;
  String? totalMutasiDebet;
  String? totalMutasiKredit;
  String? totalAkhirTiapBulan;
  String? saldoAwal;
  String? pathBuktiMutasi;

  DetailMutasi({
    this.id,
    this.mutasiRekeningId,
    this.periodeAwal,
    this.periodeAkhir,
    this.totalMutasiDebet,
    this.totalMutasiKredit,
    this.totalAkhirTiapBulan,
    this.saldoAwal,
    this.pathBuktiMutasi,
  });

  DetailMutasi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mutasiRekeningId = json['mutasiRekeningId'];
    periodeAwal = json['periodeAwal'];
    periodeAkhir = json['periodeAkhir'];
    totalMutasiDebet = json['totalMutasiDebet'];
    totalMutasiKredit = json['totalMutasiKredit'];
    totalAkhirTiapBulan = json['totalAkhirTiapBulan'];
    saldoAwal = json['saldoAwal'];
    pathBuktiMutasi = json['pathBuktiMutasi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['mutasiRekeningId'] = this.mutasiRekeningId;
    data['periodeAwal'] = this.periodeAwal;
    data['periodeAkhir'] = this.periodeAkhir;
    data['totalMutasiDebet'] = this.totalMutasiDebet;
    data['totalMutasiKredit'] = this.totalMutasiKredit;
    data['totalAkhirTiapBulan'] = this.totalAkhirTiapBulan;
    data['saldoAwal'] = this.saldoAwal;
    data['pathBuktiMutasi'] = this.pathBuktiMutasi;
    // ignore: newline-before-return
    return data;
  }
}
