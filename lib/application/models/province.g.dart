// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Province _$$_ProvinceFromJson(Map json) => $checkedCreate(
      r'_$_Province',
      json,
      ($checkedConvert) {
        final val = _$_Province(
          provinceCode: $checkedConvert('provinceCode', (v) => v as String?),
          province: $checkedConvert('province', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_ProvinceToJson(_$_Province instance) =>
    <String, dynamic>{
      'provinceCode': instance.provinceCode,
      'province': instance.province,
    };
