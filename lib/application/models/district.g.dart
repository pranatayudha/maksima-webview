// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_District _$$_DistrictFromJson(Map json) => $checkedCreate(
      r'_$_District',
      json,
      ($checkedConvert) {
        final val = _$_District(
          districtCode: $checkedConvert('districtCode', (v) => v as String?),
          district: $checkedConvert('district', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_DistrictToJson(_$_District instance) =>
    <String, dynamic>{
      'districtCode': instance.districtCode,
      'district': instance.district,
    };
