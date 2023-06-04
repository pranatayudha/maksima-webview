// ignore_for_file: prefer_collection_literals, unnecessary_this

class RitelMutasiRekeningHeader {
  String? prakarsaId;
  String? periode;
  String? totalMutasiKredit;
  String? ratasMutasiKredit;
  String? totalMutasiDebet;
  String? ratasMutasiDebet;
  String? totalSaldoAKhir;

  RitelMutasiRekeningHeader({
    this.prakarsaId,
    this.periode,
    this.totalMutasiKredit,
    this.ratasMutasiKredit,
    this.totalMutasiDebet,
    this.ratasMutasiDebet,
    this.totalSaldoAKhir,
  });

  RitelMutasiRekeningHeader.fromJson(Map<String, dynamic> json) {
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
