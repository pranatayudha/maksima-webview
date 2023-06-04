// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_screening_slik.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelScreeningSlik _$$_RitelScreeningSlikFromJson(Map json) =>
    $checkedCreate(
      r'_$_RitelScreeningSlik',
      json,
      ($checkedConvert) {
        final val = _$_RitelScreeningSlik(
          status: $checkedConvert('status', (v) => v as String?),
          reason: $checkedConvert('reason', (v) => v),
          path: $checkedConvert('path', (v) => v),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelScreeningSlikToJson(
        _$_RitelScreeningSlik instance) =>
    <String, dynamic>{
      'status': instance.status,
      'reason': instance.reason,
      'path': instance.path,
    };
