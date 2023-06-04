// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_City _$$_CityFromJson(Map json) => $checkedCreate(
      r'_$_City',
      json,
      ($checkedConvert) {
        final val = _$_City(
          cityCode: $checkedConvert('cityCode', (v) => v as String?),
          city: $checkedConvert('city', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_CityToJson(_$_City instance) => <String, dynamic>{
      'cityCode': instance.cityCode,
      'city': instance.city,
    };
