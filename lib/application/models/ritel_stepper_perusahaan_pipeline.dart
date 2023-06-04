// ignore_for_file: unnecessary_this

class RitelStepperPerusahaanModel {
  bool? informasiPerusahaan;
  bool? informasiPengurusPemilik;
  bool? informasiLainnya;

  RitelStepperPerusahaanModel({
    this.informasiPerusahaan,
    this.informasiPengurusPemilik,
    this.informasiLainnya,
  });

  RitelStepperPerusahaanModel.fromJson(Map<String, dynamic> json) {
    informasiPerusahaan = json['informasiPerusahaan'];
    informasiPengurusPemilik = json['informasiPengurusPemilik'];
    informasiLainnya = json['informasiLainnya'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['informasiPerusahaan'] = this.informasiPerusahaan;
    data['informasiPengurusPemilik'] = this.informasiPengurusPemilik;
    data['informasiLainnya'] = this.informasiLainnya;
    // ignore: newline-before-return
    return data;
  }
}
