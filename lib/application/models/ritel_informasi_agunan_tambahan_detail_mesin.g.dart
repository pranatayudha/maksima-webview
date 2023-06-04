// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_informasi_agunan_tambahan_detail_mesin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelInformasiAgunanTambahanDetailMesin
    _$$_RitelInformasiAgunanTambahanDetailMesinFromJson(Map json) =>
        $checkedCreate(
          r'_$_RitelInformasiAgunanTambahanDetailMesin',
          json,
          ($checkedConvert) {
            final val = _$_RitelInformasiAgunanTambahanDetailMesin(
              id: $checkedConvert('id', (v) => v as String?),
              prakarsaId: $checkedConvert('prakarsaId', (v) => v as String?),
              jenisPengikatan:
                  $checkedConvert('jenisPengikatan', (v) => v as String?),
              numMesin: $checkedConvert('numMesin', (v) => v as String?),
              numFaktur: $checkedConvert('numFaktur', (v) => v as String?),
              namaPemilik: $checkedConvert('namaPemilik', (v) => v as String?),
              pathFotoMesin: $checkedConvert(
                  'pathFotoMesin',
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

Map<String, dynamic> _$$_RitelInformasiAgunanTambahanDetailMesinToJson(
        _$_RitelInformasiAgunanTambahanDetailMesin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prakarsaId': instance.prakarsaId,
      'jenisPengikatan': instance.jenisPengikatan,
      'numMesin': instance.numMesin,
      'numFaktur': instance.numFaktur,
      'namaPemilik': instance.namaPemilik,
      'pathFotoMesin': instance.pathFotoMesin,
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
