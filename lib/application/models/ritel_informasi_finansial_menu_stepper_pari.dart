class RitelFinansialMenuStepperPari {
  bool? mutasiRekening;
  bool? mutasiTransaksi;
  bool? dataLaporanFinansial;

  RitelFinansialMenuStepperPari({
    this.mutasiRekening,
    this.mutasiTransaksi,
    this.dataLaporanFinansial,
  });

  RitelFinansialMenuStepperPari.fromJson(Map<String, dynamic> json) {
    mutasiRekening = json['mutasiRekening'];
    mutasiTransaksi = json['mutasiTransaksi'];
    dataLaporanFinansial = json['dataLaporanFinansial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mutasiRekening'] = mutasiRekening;
    data['mutasiTransaksi'] = mutasiTransaksi;
    data['dataLaporanFinansial'] = dataLaporanFinansial;

    return data;
  }
}
