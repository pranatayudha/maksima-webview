// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_prakarsa_info_prakarsa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelPrakarsaInfoPrakarsaPerorangan
    _$$_RitelPrakarsaInfoPrakarsaPeroranganFromJson(Map json) => $checkedCreate(
          r'_$_RitelPrakarsaInfoPrakarsaPerorangan',
          json,
          ($checkedConvert) {
            final val = _$_RitelPrakarsaInfoPrakarsaPerorangan(
              header: $checkedConvert(
                  'header',
                  (v) => v == null
                      ? null
                      : RitelPrakarsaInfoPrakarsaHeader.fromJson(
                          Map<String, dynamic>.from(v as Map))),
              body: $checkedConvert(
                  'body',
                  (v) => v == null
                      ? null
                      : RitelPrakarsaInfoPrakarsaBodyPerorangan.fromJson(
                          Map<String, dynamic>.from(v as Map))),
            );
            return val;
          },
        );

Map<String, dynamic> _$$_RitelPrakarsaInfoPrakarsaPeroranganToJson(
        _$_RitelPrakarsaInfoPrakarsaPerorangan instance) =>
    <String, dynamic>{
      'header': instance.header?.toJson(),
      'body': instance.body?.toJson(),
    };

_$_RitelPrakarsaInfoPrakarsaPTCV _$$_RitelPrakarsaInfoPrakarsaPTCVFromJson(
        Map json) =>
    $checkedCreate(
      r'_$_RitelPrakarsaInfoPrakarsaPTCV',
      json,
      ($checkedConvert) {
        final val = _$_RitelPrakarsaInfoPrakarsaPTCV(
          header: $checkedConvert(
              'header',
              (v) => v == null
                  ? null
                  : RitelPrakarsaInfoPrakarsaHeader.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          body: $checkedConvert(
              'body',
              (v) => v == null
                  ? null
                  : RitelPrakarsaInfoPrakarsaBodyPTCV.fromJson(
                      Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelPrakarsaInfoPrakarsaPTCVToJson(
        _$_RitelPrakarsaInfoPrakarsaPTCV instance) =>
    <String, dynamic>{
      'header': instance.header?.toJson(),
      'body': instance.body?.toJson(),
    };
