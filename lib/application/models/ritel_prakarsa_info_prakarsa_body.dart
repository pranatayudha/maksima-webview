// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_prakarsa_hasil_pre_screening.dart';
import 'ritel_prakarsa_informasi_agunan_lkn.dart';
import 'ritel_prakarsa_informasi_debitur.dart';
import 'ritel_prakarsa_informasi_finansial.dart';
import 'ritel_prakarsa_informasi_non_finansial.dart';
import 'ritel_prakarsa_informasi_pengurus_pemilik.dart';
import 'ritel_prakarsa_informasi_perusahaan.dart';
import 'ritel_prakarsa_informasi_pinjaman.dart';
import 'ritel_prakarsa_legalitas_usaha.dart';
import 'ritel_prakarsa_upload_crr.dart';
import 'ritel_trade_checking_stepper.dart';

part 'ritel_prakarsa_info_prakarsa_body.freezed.dart';
part 'ritel_prakarsa_info_prakarsa_body.g.dart';

@freezed
class RitelPrakarsaInfoPrakarsaBodyPerorangan
    with _$RitelPrakarsaInfoPrakarsaBodyPerorangan {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaInfoPrakarsaBodyPerorangan({
    RitelPrakarsaInformasiDebitur? informasi_debitur,
    RitelTradeCheckingStepper? trade_checking,
    RitelPrakarsaLegalitasUsaha? legalitas_usaha,
    RitelPrakarsaHasilPreScreening? hasil_pre_screening,
    RitelPrakarsaInformasiFinansial? informasi_finansial,
    RitelPrakarsaInformasiNonFinansial? informasi_non_finansial,
    RitelPrakarsaUploadCRR? upload_crr,
    RitelPrakarsaInformasiAgunanLKN? informasi_agunan_lkn,
    RitelPrakarsaInformasiPinjaman? informasi_pinjaman,
  }) = _RitelPrakarsaInfoPrakarsaBodyPerorangan;

  factory RitelPrakarsaInfoPrakarsaBodyPerorangan.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelPrakarsaInfoPrakarsaBodyPeroranganFromJson(json);
}

@freezed
class RitelPrakarsaInfoPrakarsaBodyPTCV
    with _$RitelPrakarsaInfoPrakarsaBodyPTCV {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaInfoPrakarsaBodyPTCV({
    RitelPrakarsaInformasiPerusahaan? informasi_perusahaan,
    RitelPrakarsaInformasiPengurusPemilik? informasi_pengurus_pemilik,
    RitelTradeCheckingStepper? trade_checking,
    RitelPrakarsaLegalitasUsaha? legalitas_usaha,
    RitelPrakarsaHasilPreScreening? hasil_pre_screening,
    RitelPrakarsaInformasiFinansial? informasi_finansial,
    RitelPrakarsaInformasiNonFinansial? informasi_non_finansial,
    RitelPrakarsaUploadCRR? upload_crr,
    RitelPrakarsaInformasiAgunanLKN? informasi_agunan_lkn,
    RitelPrakarsaInformasiPinjaman? informasi_pinjaman,
  }) = _RitelPrakarsaInfoPrakarsaBodyPTCV;

  factory RitelPrakarsaInfoPrakarsaBodyPTCV.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelPrakarsaInfoPrakarsaBodyPTCVFromJson(json);
}
