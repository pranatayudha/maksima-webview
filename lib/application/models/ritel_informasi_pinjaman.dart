// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_informasi_pinjaman.freezed.dart';
part 'ritel_informasi_pinjaman.g.dart';

@freezed
class RitelInformasiPinjaman with _$RitelInformasiPinjaman {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelInformasiPinjaman({
    String? id,
    String? prakarsaId,
    String? jenisKredit,
    int? loanTypesId,
    String? tujuanPenggunaan,
    String? sifatKredit,
    String? bungaPinjaman,
    int? jangkaWaktuFasilitas,
    String? nominalPengajuanAwal,
    String? asumsiPerhitunganKredit,
    String? nilaiProyek,
    String? asumsiPPN,
    String? nilaiProyekSetelahPPN,
    String? asumsiLaba,
    String? biayaProyekNetto,
    int? sharingDanaSendiri,
    String? biayaProyekNettoSDS,
    String? asumsiUangMuka,
    String? besarKMKPTR,
    String? kreditBankLain,
    String? maksimalKredit,
    String? rekomendasiPlafond,
    String? biayaProvisi,
    String? biayaAdministrasi,
    String? biayaPremi,
    String? nilaiTransaksi,
    String? suratPermohonanPath,
  }) = _RitelInformasiPinjaman;

  factory RitelInformasiPinjaman.fromJson(Map<String, dynamic> json) =>
      _$RitelInformasiPinjamanFromJson(json);
}
