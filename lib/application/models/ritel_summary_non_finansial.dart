// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, newline-before-return

class RitelSummaryNonFinansial {
  String? prakarsaId;
  int? score;
  Karakter? karakter;
  PosisiPasar? posisiPasar;
  SituasiPersaingan? situasiPersaingan;
  Manajemen? manajemen;
  ProspekIndustri? prospekIndustri;
  Jaminan? jaminan;

  RitelSummaryNonFinansial({
    this.prakarsaId,
    this.score,
    this.karakter,
    this.posisiPasar,
    this.situasiPersaingan,
    this.manajemen,
    this.prospekIndustri,
    this.jaminan,
  });

  RitelSummaryNonFinansial.fromJson(Map<String, dynamic> json) {
    prakarsaId = json['prakarsaId'];
    score = json['score'];
    karakter = json['karakter'] != null
        ? new Karakter.fromJson(json['karakter'])
        : null;
    posisiPasar = json['posisiPasar'] != null
        ? new PosisiPasar.fromJson(json['posisiPasar'])
        : null;
    situasiPersaingan = json['situasiPersaingan'] != null
        ? new SituasiPersaingan.fromJson(json['situasiPersaingan'])
        : null;
    manajemen = json['manajemen'] != null
        ? new Manajemen.fromJson(json['manajemen'])
        : null;
    prospekIndustri = json['prospekIndustri'] != null
        ? new ProspekIndustri.fromJson(json['prospekIndustri'])
        : null;
    jaminan =
        json['jaminan'] != null ? new Jaminan.fromJson(json['jaminan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prakarsaId'] = this.prakarsaId;
    data['score'] = this.score;
    if (this.karakter != null) {
      data['karakter'] = this.karakter!.toJson();
    }
    if (this.posisiPasar != null) {
      data['posisiPasar'] = this.posisiPasar!.toJson();
    }
    if (this.situasiPersaingan != null) {
      data['situasiPersaingan'] = this.situasiPersaingan!.toJson();
    }
    if (this.manajemen != null) {
      data['manajemen'] = this.manajemen!.toJson();
    }
    if (this.prospekIndustri != null) {
      data['prospekIndustri'] = this.prospekIndustri!.toJson();
    }
    if (this.jaminan != null) {
      data['jaminan'] = this.jaminan!.toJson();
    }
    return data;
  }
}

class Karakter {
  TingkatKepercayaan? tingkatKepercayaan;
  TingkatKepercayaan? pengelolaanRekeningBank;
  TingkatKepercayaan? reputasiBisnis;
  TingkatKepercayaan? perilakuPribadiDebitur;

  Karakter({
    this.tingkatKepercayaan,
    this.pengelolaanRekeningBank,
    this.reputasiBisnis,
    this.perilakuPribadiDebitur,
  });

  Karakter.fromJson(Map<String, dynamic> json) {
    tingkatKepercayaan = json['tingkatKepercayaan'] != null
        ? new TingkatKepercayaan.fromJson(json['tingkatKepercayaan'])
        : null;
    pengelolaanRekeningBank = json['pengelolaanRekeningBank'] != null
        ? new TingkatKepercayaan.fromJson(json['pengelolaanRekeningBank'])
        : null;
    reputasiBisnis = json['reputasiBisnis'] != null
        ? new TingkatKepercayaan.fromJson(json['reputasiBisnis'])
        : null;
    perilakuPribadiDebitur = json['perilakuPribadiDebitur'] != null
        ? new TingkatKepercayaan.fromJson(json['perilakuPribadiDebitur'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tingkatKepercayaan != null) {
      data['tingkatKepercayaan'] = this.tingkatKepercayaan!.toJson();
    }
    if (this.pengelolaanRekeningBank != null) {
      data['pengelolaanRekeningBank'] = this.pengelolaanRekeningBank!.toJson();
    }
    if (this.reputasiBisnis != null) {
      data['reputasiBisnis'] = this.reputasiBisnis!.toJson();
    }
    if (this.perilakuPribadiDebitur != null) {
      data['perilakuPribadiDebitur'] = this.perilakuPribadiDebitur!.toJson();
    }
    return data;
  }
}

class TingkatKepercayaan {
  int? resultIndex;
  List<DescDetail>? descDetail;

  TingkatKepercayaan({this.resultIndex, this.descDetail});

  TingkatKepercayaan.fromJson(Map<String, dynamic> json) {
    resultIndex = json['resultIndex'];
    if (json['descDetail'] != null) {
      descDetail = <DescDetail>[];
      json['descDetail'].forEach((v) {
        descDetail!.add(new DescDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultIndex'] = this.resultIndex;
    if (this.descDetail != null) {
      data['descDetail'] = this.descDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DescDetail {
  String? desc;
  bool? result;

  DescDetail({this.desc, this.result});

  DescDetail.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['result'] = this.result;
    return data;
  }
}

class PosisiPasar {
  TingkatKepercayaan? kualitasProduk;
  TingkatKepercayaan? strategiKetergantungan;
  TingkatKepercayaan? lokasiUsaha;

  PosisiPasar({
    this.kualitasProduk,
    this.strategiKetergantungan,
    this.lokasiUsaha,
  });

  PosisiPasar.fromJson(Map<String, dynamic> json) {
    kualitasProduk = json['kualitasProduk'] != null
        ? new TingkatKepercayaan.fromJson(json['kualitasProduk'])
        : null;
    strategiKetergantungan = json['strategiKetergantungan'] != null
        ? new TingkatKepercayaan.fromJson(json['strategiKetergantungan'])
        : null;
    lokasiUsaha = json['lokasiUsaha'] != null
        ? new TingkatKepercayaan.fromJson(json['lokasiUsaha'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.kualitasProduk != null) {
      data['kualitasProduk'] = this.kualitasProduk!.toJson();
    }
    if (this.strategiKetergantungan != null) {
      data['strategiKetergantungan'] = this.strategiKetergantungan!.toJson();
    }
    if (this.lokasiUsaha != null) {
      data['lokasiUsaha'] = this.lokasiUsaha!.toJson();
    }
    return data;
  }
}

class SituasiPersaingan {
  TingkatKepercayaan? perkembanganPasar;

  SituasiPersaingan({this.perkembanganPasar});

  SituasiPersaingan.fromJson(Map<String, dynamic> json) {
    perkembanganPasar = json['perkembanganPasar'] != null
        ? new TingkatKepercayaan.fromJson(json['perkembanganPasar'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.perkembanganPasar != null) {
      data['perkembanganPasar'] = this.perkembanganPasar!.toJson();
    }
    return data;
  }
}

class Manajemen {
  TingkatKepercayaan? kualifikasiKomersial;
  TingkatKepercayaan? kualifikasiTeknis;
  TingkatKepercayaan? sturukturInternalPerusahaan;

  Manajemen({
    this.kualifikasiKomersial,
    this.kualifikasiTeknis,
    this.sturukturInternalPerusahaan,
  });

  Manajemen.fromJson(Map<String, dynamic> json) {
    kualifikasiKomersial = json['kualifikasiKomersial'] != null
        ? new TingkatKepercayaan.fromJson(json['kualifikasiKomersial'])
        : null;
    kualifikasiTeknis = json['kualifikasiTeknis'] != null
        ? new TingkatKepercayaan.fromJson(json['kualifikasiTeknis'])
        : null;
    sturukturInternalPerusahaan = json['sturukturInternalPerusahaan'] != null
        ? new TingkatKepercayaan.fromJson(json['sturukturInternalPerusahaan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.kualifikasiKomersial != null) {
      data['kualifikasiKomersial'] = this.kualifikasiKomersial!.toJson();
    }
    if (this.kualifikasiTeknis != null) {
      data['kualifikasiTeknis'] = this.kualifikasiTeknis!.toJson();
    }
    if (this.sturukturInternalPerusahaan != null) {
      data['sturukturInternalPerusahaan'] =
          this.sturukturInternalPerusahaan!.toJson();
    }
    return data;
  }
}

class ProspekIndustri {
  TingkatKepercayaan? prospekIndustri2;

  ProspekIndustri({this.prospekIndustri2});

  ProspekIndustri.fromJson(Map<String, dynamic> json) {
    prospekIndustri2 = json['prospekIndustri2'] != null
        ? new TingkatKepercayaan.fromJson(json['prospekIndustri2'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.prospekIndustri2 != null) {
      data['prospekIndustri2'] = this.prospekIndustri2!.toJson();
    }
    return data;
  }
}

class Jaminan {
  TingkatKepercayaan? coverageAgunan;
  TingkatKepercayaan? hubunganKepemilikanAgunan;
  TingkatKepercayaan? marketabiitasAgunan;

  Jaminan({
    this.coverageAgunan,
    this.hubunganKepemilikanAgunan,
    this.marketabiitasAgunan,
  });

  Jaminan.fromJson(Map<String, dynamic> json) {
    coverageAgunan = json['coverageAgunan'] != null
        ? new TingkatKepercayaan.fromJson(json['coverageAgunan'])
        : null;
    hubunganKepemilikanAgunan = json['hubunganKepemilikanAgunan'] != null
        ? new TingkatKepercayaan.fromJson(json['hubunganKepemilikanAgunan'])
        : null;
    marketabiitasAgunan = json['marketabiitasAgunan'] != null
        ? new TingkatKepercayaan.fromJson(json['marketabiitasAgunan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coverageAgunan != null) {
      data['coverageAgunan'] = this.coverageAgunan!.toJson();
    }
    if (this.hubunganKepemilikanAgunan != null) {
      data['hubunganKepemilikanAgunan'] =
          this.hubunganKepemilikanAgunan!.toJson();
    }
    if (this.marketabiitasAgunan != null) {
      data['marketabiitasAgunan'] = this.marketabiitasAgunan!.toJson();
    }
    return data;
  }
}
