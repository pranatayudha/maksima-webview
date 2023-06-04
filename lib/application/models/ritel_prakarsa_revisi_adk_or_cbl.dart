// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, newline-before-return

class RitelRevisiAdkOrCbl {
  String? infoDataDebitur;
  String? hasilPreScreening;
  String? informasiFinansial;
  String? informasiNonFinansial;
  String? informasiAgunan;
  String? tradeChecking;
  String? informasiPinjaman;
  String? crr;
  String? draftPTK;

  RitelRevisiAdkOrCbl({
    this.infoDataDebitur,
    this.hasilPreScreening,
    this.informasiFinansial,
    this.informasiNonFinansial,
    this.informasiAgunan,
    this.tradeChecking,
    this.informasiPinjaman,
    this.crr,
    this.draftPTK,
  });

  RitelRevisiAdkOrCbl.fromJson(Map<String, dynamic> json) {
    infoDataDebitur = json['infoDataDebitur'];
    hasilPreScreening = json['hasilPreScreening'];
    informasiFinansial = json['informasiFinansial'];
    informasiNonFinansial = json['informasiNonFinansial'];
    informasiAgunan = json['informasiAgunan'];
    tradeChecking = json['tradeChecking'];
    informasiPinjaman = json['informasiPinjaman'];
    crr = json['crr'];
    draftPTK = json['draftPTK'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['infoDataDebitur'] = this.infoDataDebitur;
    data['hasilPreScreening'] = this.hasilPreScreening;
    data['informasiFinansial'] = this.informasiFinansial;
    data['informasiNonFinansial'] = this.informasiNonFinansial;
    data['informasiAgunan'] = this.informasiAgunan;
    data['tradeChecking'] = this.tradeChecking;
    data['informasiPinjaman'] = this.informasiPinjaman;
    data['crr'] = this.crr;
    data['draftPTK'] = this.draftPTK;
    return data;
  }
}
