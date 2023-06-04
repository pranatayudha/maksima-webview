// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_prakarsa_status_pengajuan_object.dart';

part 'ritel_prakarsa_status_pengajuan_body.freezed.dart';
part 'ritel_prakarsa_status_pengajuan_body.g.dart';

@freezed
class RitelPrakarsaStatusPengajuanBodyPTR
    with _$RitelPrakarsaStatusPengajuanBodyPTR {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaStatusPengajuanBodyPTR({
    int? pre_screening_approved,
    int? analisa_pinjaman_nasabah,
    int? hasil_analisa_pinjaman,
    dynamic revisi,
    RitelPrakarsaStatusPengajuanObject? verifikasi_ADK_cabang,
    RitelPrakarsaStatusPengajuanObject? verifikasi_CBL,
    RitelPrakarsaStatusPengajuanObject? putusan_kredit_CBL,
    RitelPrakarsaStatusPengajuanObject? putusan_kredit_kadiv,
    int? offering_debitur,
    int? proses_akad_kredit,
    int? proses_pembuatan_fasilitas,
  }) = _RitelPrakarsaStatusPengajuanBodyPTR;

  factory RitelPrakarsaStatusPengajuanBodyPTR.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelPrakarsaStatusPengajuanBodyPTRFromJson(json);
}
