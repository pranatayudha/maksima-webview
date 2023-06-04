// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_prakarsa_perorangan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelPrakarsaPerorangan _$$_RitelPrakarsaPeroranganFromJson(Map json) =>
    $checkedCreate(
      r'_$_RitelPrakarsaPerorangan',
      json,
      ($checkedConvert) {
        final val = _$_RitelPrakarsaPerorangan(
          id: $checkedConvert('id', (v) => v as String?),
          pipeline_flagId:
              $checkedConvert('pipeline_flagId', (v) => v as String?),
          ktpNum: $checkedConvert('ktpNum', (v) => v as String?),
          fullName: $checkedConvert('fullName', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelPrakarsaPeroranganToJson(
        _$_RitelPrakarsaPerorangan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pipeline_flagId': instance.pipeline_flagId,
      'ktpNum': instance.ktpNum,
      'fullName': instance.fullName,
    };
