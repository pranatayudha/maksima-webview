// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_tag_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelTagLocation _$$_RitelTagLocationFromJson(Map json) => $checkedCreate(
      r'_$_RitelTagLocation',
      json,
      ($checkedConvert) {
        final val = _$_RitelTagLocation(
          latLng: $checkedConvert('latLng', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelTagLocationToJson(_$_RitelTagLocation instance) =>
    <String, dynamic>{
      'latLng': instance.latLng,
      'name': instance.name,
    };
