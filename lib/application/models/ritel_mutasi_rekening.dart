// ignore_for_file: prefer_collection_literals

class RitelMutasiRekening {
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

  RitelMutasiRekening({
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

  RitelMutasiRekening.fromJson(Map<String, dynamic> json) {
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
    data['id'] = id;
    data['prakarsaId'] = prakarsaId;
    data['bank'] = bank;
    data['namaBank'] = namaBank;
    data['noRekening'] = noRekening;
    data['totalMonth'] = totalMonth;
    data['periode'] = periode;
    data['totalMutasiKredit'] = totalMutasiKredit;
    data['ratasMutasiKredit'] = ratasMutasiKredit;
    data['totalMutasiDebet'] = totalMutasiDebet;
    data['ratasMutasiDebet'] = ratasMutasiDebet;
    data['totalSaldoAKhir'] = totalSaldoAKhir;
    if (detailMutasi != null) {
      data['detailMutasi'] = detailMutasi!.map((v) => v.toJson()).toList();
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
    data['id'] = id;
    data['mutasiRekeningId'] = mutasiRekeningId;
    data['periodeAwal'] = periodeAwal;
    data['periodeAkhir'] = periodeAkhir;
    data['totalMutasiDebet'] = totalMutasiDebet;
    data['totalMutasiKredit'] = totalMutasiKredit;
    data['totalAkhirTiapBulan'] = totalAkhirTiapBulan;
    data['saldoAwal'] = saldoAwal;
    data['pathBuktiMutasi'] = pathBuktiMutasi;
    // ignore: newline-before-return
    return data;
  }
}
