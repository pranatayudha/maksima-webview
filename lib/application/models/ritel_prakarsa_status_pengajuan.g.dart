// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_prakarsa_status_pengajuan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelPrakarsaStatusPengajuan _$$_RitelPrakarsaStatusPengajuanFromJson(
        Map json) =>
    $checkedCreate(
      r'_$_RitelPrakarsaStatusPengajuan',
      json,
      ($checkedConvert) {
        final val = _$_RitelPrakarsaStatusPengajuan(
          header: $checkedConvert(
              'header',
              (v) => v == null
                  ? null
                  : RitelPrakarsaStatusPengajuanHeader.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          body: $checkedConvert(
              'body',
              (v) => v == null
                  ? null
                  : RitelPrakarsaStatusPengajuanBodyPTR.fromJson(
                      Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelPrakarsaStatusPengajuanToJson(
        _$_RitelPrakarsaStatusPengajuan instance) =>
    <String, dynamic>{
      'header': instance.header?.toJson(),
      'body': instance.body?.toJson(),
    };
