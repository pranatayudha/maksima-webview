// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_ritel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FilterRitel _$$_FilterRitelFromJson(Map json) => $checkedCreate(
      r'_$_FilterRitel',
      json,
      ($checkedConvert) {
        final val = _$_FilterRitel(
          name: $checkedConvert('name', (v) => v as String?),
          value: $checkedConvert('value', (v) => v as int?),
          status: $checkedConvert('status', (v) => v as bool?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_FilterRitelToJson(_$_FilterRitel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'status': instance.status,
    };
