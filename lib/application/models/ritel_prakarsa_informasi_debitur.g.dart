// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_prakarsa_informasi_debitur.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelPrakarsaInformasiDebitur _$$_RitelPrakarsaInformasiDebiturFromJson(
        Map json) =>
    $checkedCreate(
      r'_$_RitelPrakarsaInformasiDebitur',
      json,
      ($checkedConvert) {
        final val = _$_RitelPrakarsaInformasiDebitur(
          status: $checkedConvert('status', (v) => v as bool?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelPrakarsaInformasiDebiturToJson(
        _$_RitelPrakarsaInformasiDebitur instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
