// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_screening_dukcapil.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelScreeningDukcapil _$$_RitelScreeningDukcapilFromJson(Map json) =>
    $checkedCreate(
      r'_$_RitelScreeningDukcapil',
      json,
      ($checkedConvert) {
        final val = _$_RitelScreeningDukcapil(
          status: $checkedConvert('status', (v) => v as String?),
          reason: $checkedConvert('reason', (v) => v),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelScreeningDukcapilToJson(
        _$_RitelScreeningDukcapil instance) =>
    <String, dynamic>{
      'status': instance.status,
      'reason': instance.reason,
    };
