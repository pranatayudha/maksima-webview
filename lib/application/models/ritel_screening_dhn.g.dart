// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_screening_dhn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelScreeningDHN _$$_RitelScreeningDHNFromJson(Map json) => $checkedCreate(
      r'_$_RitelScreeningDHN',
      json,
      ($checkedConvert) {
        final val = _$_RitelScreeningDHN(
          status: $checkedConvert('status', (v) => v as String?),
          reason: $checkedConvert('reason', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelScreeningDHNToJson(
        _$_RitelScreeningDHN instance) =>
    <String, dynamic>{
      'status': instance.status,
      'reason': instance.reason,
    };
