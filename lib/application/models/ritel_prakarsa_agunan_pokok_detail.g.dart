// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_prakarsa_agunan_pokok_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelPrakarsaAgunanPokokDetail _$$_RitelPrakarsaAgunanPokokDetailFromJson(
        Map json) =>
    $checkedCreate(
      r'_$_RitelPrakarsaAgunanPokokDetail',
      json,
      ($checkedConvert) {
        final val = _$_RitelPrakarsaAgunanPokokDetail(
          id: $checkedConvert('id', (v) => v as String?),
          prakarsaId: $checkedConvert('prakarsaId', (v) => v as String?),
          jenisAgunanPokok:
              $checkedConvert('jenisAgunanPokok', (v) => v as int?),
          pathUploadExcel:
              $checkedConvert('pathUploadExcel', (v) => v as String?),
          jenisPengikatan:
              $checkedConvert('jenisPengikatan', (v) => v as String?),
          pathFotoAgunanPersediaan: $checkedConvert('pathFotoAgunanPersediaan',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          NPW: $checkedConvert('NPW', (v) => v as String?),
          NL: $checkedConvert('NL', (v) => v as String?),
          PNPW: $checkedConvert('PNPW', (v) => v as String?),
          PNL: $checkedConvert('PNL', (v) => v as String?),
          nilaiPengikatan:
              $checkedConvert('nilaiPengikatan', (v) => v as String?),
          nominalTotalPiutang:
              $checkedConvert('nominalTotalPiutang', (v) => v as String?),
          jumlahStock: $checkedConvert('jumlahStock', (v) => v as String?),
          totalNilaiPasarWajarAgunan: $checkedConvert(
              'totalNilaiPasarWajarAgunan', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelPrakarsaAgunanPokokDetailToJson(
        _$_RitelPrakarsaAgunanPokokDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prakarsaId': instance.prakarsaId,
      'jenisAgunanPokok': instance.jenisAgunanPokok,
      'pathUploadExcel': instance.pathUploadExcel,
      'jenisPengikatan': instance.jenisPengikatan,
      'pathFotoAgunanPersediaan': instance.pathFotoAgunanPersediaan,
      'NPW': instance.NPW,
      'NL': instance.NL,
      'PNPW': instance.PNPW,
      'PNL': instance.PNL,
      'nilaiPengikatan': instance.nilaiPengikatan,
      'nominalTotalPiutang': instance.nominalTotalPiutang,
      'jumlahStock': instance.jumlahStock,
      'totalNilaiPasarWajarAgunan': instance.totalNilaiPasarWajarAgunan,
    };
