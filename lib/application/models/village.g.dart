// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'village.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Village _$$_VillageFromJson(Map json) => $checkedCreate(
      r'_$_Village',
      json,
      ($checkedConvert) {
        final val = _$_Village(
          villageCode: $checkedConvert('villageCode', (v) => v as String?),
          village: $checkedConvert('village', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_VillageToJson(_$_Village instance) =>
    <String, dynamic>{
      'villageCode': instance.villageCode,
      'village': instance.village,
    };
