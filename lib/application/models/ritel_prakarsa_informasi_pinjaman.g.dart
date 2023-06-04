// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_prakarsa_informasi_pinjaman.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelPrakarsaInformasiPinjaman _$$_RitelPrakarsaInformasiPinjamanFromJson(
        Map json) =>
    $checkedCreate(
      r'_$_RitelPrakarsaInformasiPinjaman',
      json,
      ($checkedConvert) {
        final val = _$_RitelPrakarsaInformasiPinjaman(
          status: $checkedConvert('status', (v) => v as bool?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelPrakarsaInformasiPinjamanToJson(
        _$_RitelPrakarsaInformasiPinjaman instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
