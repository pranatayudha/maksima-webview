// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_prakarsa_informasi_finansial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelPrakarsaInformasiFinansial _$$_RitelPrakarsaInformasiFinansialFromJson(
        Map json) =>
    $checkedCreate(
      r'_$_RitelPrakarsaInformasiFinansial',
      json,
      ($checkedConvert) {
        final val = _$_RitelPrakarsaInformasiFinansial(
          status: $checkedConvert('status', (v) => v as bool?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelPrakarsaInformasiFinansialToJson(
        _$_RitelPrakarsaInformasiFinansial instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
