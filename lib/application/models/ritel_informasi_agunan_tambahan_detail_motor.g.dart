// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_informasi_agunan_tambahan_detail_motor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelInformasiAgunanTambahanDetailMotor
    _$$_RitelInformasiAgunanTambahanDetailMotorFromJson(Map json) =>
        $checkedCreate(
          r'_$_RitelInformasiAgunanTambahanDetailMotor',
          json,
          ($checkedConvert) {
            final val = _$_RitelInformasiAgunanTambahanDetailMotor(
              id: $checkedConvert('id', (v) => v as String?),
              prakarsaId: $checkedConvert('prakarsaId', (v) => v as String?),
              jenisPengikatan:
                  $checkedConvert('jenisPengikatan', (v) => v as String?),
              jenisKendaraan:
                  $checkedConvert('jenisKendaraan', (v) => v as String?),
              merk: $checkedConvert('merk', (v) => v as String?),
              tahunKeluar: $checkedConvert('tahunKeluar', (v) => v as int?),
              warna: $checkedConvert('warna', (v) => v as String?),
              numRangkaMesin:
                  $checkedConvert('numRangkaMesin', (v) => v as String?),
              numBPKB: $checkedConvert('numBPKB', (v) => v as String?),
              numSTNK: $checkedConvert('numSTNK', (v) => v as String?),
              kepemilikkan:
                  $checkedConvert('kepemilikkan', (v) => v as String?),
              namaPemilik: $checkedConvert('namaPemilik', (v) => v as String?),
              pathFotoAgunanTambahan: $checkedConvert(
                  'pathFotoAgunanTambahan',
                  (v) =>
                      (v as List<dynamic>?)?.map((e) => e as String).toList()),
              pathDataPembanding: $checkedConvert(
                  'pathDataPembanding',
                  (v) =>
                      (v as List<dynamic>?)?.map((e) => e as String).toList()),
              NPW: $checkedConvert('NPW', (v) => v as String?),
              NL: $checkedConvert('NL', (v) => v as String?),
              PNPW: $checkedConvert('PNPW', (v) => v as String?),
              PNL: $checkedConvert('PNL', (v) => v as String?),
              nilaiPengikatan:
                  $checkedConvert('nilaiPengikatan', (v) => v as String?),
              delFlag: $checkedConvert('delFlag', (v) => v as bool?),
              createdAt: $checkedConvert('createdAt', (v) => v as String?),
              createdBy: $checkedConvert('createdBy', (v) => v as String?),
              updatedAt: $checkedConvert('updatedAt', (v) => v as String?),
              updatedBy: $checkedConvert('updatedBy', (v) => v as String?),
            );
            return val;
          },
        );

Map<String, dynamic> _$$_RitelInformasiAgunanTambahanDetailMotorToJson(
        _$_RitelInformasiAgunanTambahanDetailMotor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prakarsaId': instance.prakarsaId,
      'jenisPengikatan': instance.jenisPengikatan,
      'jenisKendaraan': instance.jenisKendaraan,
      'merk': instance.merk,
      'tahunKeluar': instance.tahunKeluar,
      'warna': instance.warna,
      'numRangkaMesin': instance.numRangkaMesin,
      'numBPKB': instance.numBPKB,
      'numSTNK': instance.numSTNK,
      'kepemilikkan': instance.kepemilikkan,
      'namaPemilik': instance.namaPemilik,
      'pathFotoAgunanTambahan': instance.pathFotoAgunanTambahan,
      'pathDataPembanding': instance.pathDataPembanding,
      'NPW': instance.NPW,
      'NL': instance.NL,
      'PNPW': instance.PNPW,
      'PNL': instance.PNL,
      'nilaiPengikatan': instance.nilaiPengikatan,
      'delFlag': instance.delFlag,
      'createdAt': instance.createdAt,
      'createdBy': instance.createdBy,
      'updatedAt': instance.updatedAt,
      'updatedBy': instance.updatedBy,
    };
