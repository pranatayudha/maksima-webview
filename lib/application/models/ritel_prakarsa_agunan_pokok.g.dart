// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_prakarsa_agunan_pokok.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelPrakarsaAgunanPokok _$$_RitelPrakarsaAgunanPokokFromJson(Map json) =>
    $checkedCreate(
      r'_$_RitelPrakarsaAgunanPokok',
      json,
      ($checkedConvert) {
        final val = _$_RitelPrakarsaAgunanPokok(
          id: $checkedConvert('id', (v) => v as String?),
          prakarsaId: $checkedConvert('prakarsaId', (v) => v as String?),
          status: $checkedConvert('status', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelPrakarsaAgunanPokokToJson(
        _$_RitelPrakarsaAgunanPokok instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prakarsaId': instance.prakarsaId,
      'status': instance.status,
    };
