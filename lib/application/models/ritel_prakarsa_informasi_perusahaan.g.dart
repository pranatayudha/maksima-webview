// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_prakarsa_informasi_perusahaan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelPrakarsaInformasiPerusahaan
    _$$_RitelPrakarsaInformasiPerusahaanFromJson(Map json) => $checkedCreate(
          r'_$_RitelPrakarsaInformasiPerusahaan',
          json,
          ($checkedConvert) {
            final val = _$_RitelPrakarsaInformasiPerusahaan(
              id: $checkedConvert('id', (v) => v as String?),
              status: $checkedConvert('status', (v) => v as bool?),
            );
            return val;
          },
        );

Map<String, dynamic> _$$_RitelPrakarsaInformasiPerusahaanToJson(
        _$_RitelPrakarsaInformasiPerusahaan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
    };
