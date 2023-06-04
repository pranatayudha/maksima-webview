// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_prakarsa_status_pengajuan_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelPrakarsaStatusPengajuanBodyPTR
    _$$_RitelPrakarsaStatusPengajuanBodyPTRFromJson(Map json) => $checkedCreate(
          r'_$_RitelPrakarsaStatusPengajuanBodyPTR',
          json,
          ($checkedConvert) {
            final val = _$_RitelPrakarsaStatusPengajuanBodyPTR(
              pre_screening_approved:
                  $checkedConvert('pre_screening_approved', (v) => v as int?),
              analisa_pinjaman_nasabah:
                  $checkedConvert('analisa_pinjaman_nasabah', (v) => v as int?),
              hasil_analisa_pinjaman:
                  $checkedConvert('hasil_analisa_pinjaman', (v) => v as int?),
              revisi: $checkedConvert('revisi', (v) => v),
              verifikasi_ADK_cabang: $checkedConvert(
                  'verifikasi_ADK_cabang',
                  (v) => v == null
                      ? null
                      : RitelPrakarsaStatusPengajuanObject.fromJson(
                          Map<String, dynamic>.from(v as Map))),
              verifikasi_CBL: $checkedConvert(
                  'verifikasi_CBL',
                  (v) => v == null
                      ? null
                      : RitelPrakarsaStatusPengajuanObject.fromJson(
                          Map<String, dynamic>.from(v as Map))),
              putusan_kredit_CBL: $checkedConvert(
                  'putusan_kredit_CBL',
                  (v) => v == null
                      ? null
                      : RitelPrakarsaStatusPengajuanObject.fromJson(
                          Map<String, dynamic>.from(v as Map))),
              putusan_kredit_kadiv: $checkedConvert(
                  'putusan_kredit_kadiv',
                  (v) => v == null
                      ? null
                      : RitelPrakarsaStatusPengajuanObject.fromJson(
                          Map<String, dynamic>.from(v as Map))),
              offering_debitur:
                  $checkedConvert('offering_debitur', (v) => v as int?),
              proses_akad_kredit:
                  $checkedConvert('proses_akad_kredit', (v) => v as int?),
              proses_pembuatan_fasilitas: $checkedConvert(
                  'proses_pembuatan_fasilitas', (v) => v as int?),
            );
            return val;
          },
        );

Map<String, dynamic> _$$_RitelPrakarsaStatusPengajuanBodyPTRToJson(
        _$_RitelPrakarsaStatusPengajuanBodyPTR instance) =>
    <String, dynamic>{
      'pre_screening_approved': instance.pre_screening_approved,
      'analisa_pinjaman_nasabah': instance.analisa_pinjaman_nasabah,
      'hasil_analisa_pinjaman': instance.hasil_analisa_pinjaman,
      'revisi': instance.revisi,
      'verifikasi_ADK_cabang': instance.verifikasi_ADK_cabang?.toJson(),
      'verifikasi_CBL': instance.verifikasi_CBL?.toJson(),
      'putusan_kredit_CBL': instance.putusan_kredit_CBL?.toJson(),
      'putusan_kredit_kadiv': instance.putusan_kredit_kadiv?.toJson(),
      'offering_debitur': instance.offering_debitur,
      'proses_akad_kredit': instance.proses_akad_kredit,
      'proses_pembuatan_fasilitas': instance.proses_pembuatan_fasilitas,
    };
