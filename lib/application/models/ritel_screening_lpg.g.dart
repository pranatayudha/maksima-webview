// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_screening_lpg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelScreeningLPG _$$_RitelScreeningLPGFromJson(Map json) => $checkedCreate(
      r'_$_RitelScreeningLPG',
      json,
      ($checkedConvert) {
        final val = _$_RitelScreeningLPG(
          status: $checkedConvert('status', (v) => v as String?),
          reason: $checkedConvert('reason', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelScreeningLPGToJson(
        _$_RitelScreeningLPG instance) =>
    <String, dynamic>{
      'status': instance.status,
      'reason': instance.reason,
    };
