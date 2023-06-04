// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'economy_sector_ritel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EconomySectorRitel _$$_EconomySectorRitelFromJson(Map json) =>
    $checkedCreate(
      r'_$_EconomySectorRitel',
      json,
      ($checkedConvert) {
        final val = _$_EconomySectorRitel(
          economy_sectorsId:
              $checkedConvert('economy_sectorsId', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_EconomySectorRitelToJson(
        _$_EconomySectorRitel instance) =>
    <String, dynamic>{
      'economy_sectorsId': instance.economy_sectorsId,
      'name': instance.name,
    };
