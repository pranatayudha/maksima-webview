// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_informasi_agunan_tambahan_detail_tanah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelInformasiAgunanTambahanDetailTanah
    _$$_RitelInformasiAgunanTambahanDetailTanahFromJson(Map json) =>
        $checkedCreate(
          r'_$_RitelInformasiAgunanTambahanDetailTanah',
          json,
          ($checkedConvert) {
            final val = _$_RitelInformasiAgunanTambahanDetailTanah(
              id: $checkedConvert('id', (v) => v as String?),
              prakarsaId: $checkedConvert('prakarsaId', (v) => v as String?),
              jenisPengikatan:
                  $checkedConvert('jenisPengikatan', (v) => v as String?),
              luasTanah: $checkedConvert('luasTanah', (v) => v as String?),
              NOP: $checkedConvert('NOP', (v) => v as String?),
              jenisSertifikat:
                  $checkedConvert('jenisSertifikat', (v) => v as String?),
              numSertifikat:
                  $checkedConvert('numSertifikat', (v) => v as String?),
              namaPemilik: $checkedConvert('namaPemilik', (v) => v as String?),
              jatuhTempo: $checkedConvert('jatuhTempo', (v) => v as String?),
              pathBuktiBayarPBBTerakhir: $checkedConvert(
                  'pathBuktiBayarPBBTerakhir',
                  (v) =>
                      (v as List<dynamic>?)?.map((e) => e as String).toList()),
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
              tagLocation: $checkedConvert(
                  'tagLocation',
                  (v) => v == null
                      ? null
                      : RitelTagLocation.fromJson(
                          Map<String, dynamic>.from(v as Map))),
              detail: $checkedConvert('detail', (v) => v as String?),
              postalCode: $checkedConvert('postalCode', (v) => v as String?),
              province: $checkedConvert('province', (v) => v as String?),
              city: $checkedConvert('city', (v) => v as String?),
              district: $checkedConvert('district', (v) => v as String?),
              village: $checkedConvert('village', (v) => v as String?),
              rt: $checkedConvert('rt', (v) => v as String?),
              rw: $checkedConvert('rw', (v) => v as String?),
            );
            return val;
          },
        );

Map<String, dynamic> _$$_RitelInformasiAgunanTambahanDetailTanahToJson(
        _$_RitelInformasiAgunanTambahanDetailTanah instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prakarsaId': instance.prakarsaId,
      'jenisPengikatan': instance.jenisPengikatan,
      'luasTanah': instance.luasTanah,
      'NOP': instance.NOP,
      'jenisSertifikat': instance.jenisSertifikat,
      'numSertifikat': instance.numSertifikat,
      'namaPemilik': instance.namaPemilik,
      'jatuhTempo': instance.jatuhTempo,
      'pathBuktiBayarPBBTerakhir': instance.pathBuktiBayarPBBTerakhir,
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
      'tagLocation': instance.tagLocation?.toJson(),
      'detail': instance.detail,
      'postalCode': instance.postalCode,
      'province': instance.province,
      'city': instance.city,
      'district': instance.district,
      'village': instance.village,
      'rt': instance.rt,
      'rw': instance.rw,
    };
