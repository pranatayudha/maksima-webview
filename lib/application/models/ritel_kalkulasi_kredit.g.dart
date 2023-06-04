// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_kalkulasi_kredit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelKalkulasiKredit _$$_RitelKalkulasiKreditFromJson(Map json) =>
    $checkedCreate(
      r'_$_RitelKalkulasiKredit',
      json,
      ($checkedConvert) {
        final val = _$_RitelKalkulasiKredit(
          prakarsaId: $checkedConvert('prakarsaId', (v) => v as String?),
          tipeKalkulasi: $checkedConvert('tipeKalkulasi', (v) => v as String?),
          nilaiProyek: $checkedConvert('nilaiProyek', (v) => v),
          asumsiPPN: $checkedConvert('asumsiPPN', (v) => v),
          nilaiProyekSetelahPPN:
              $checkedConvert('nilaiProyekSetelahPPN', (v) => v),
          asumsiLaba: $checkedConvert('asumsiLaba', (v) => v),
          biayaProyekNetto: $checkedConvert('biayaProyekNetto', (v) => v),
          sharingDanaSendiri: $checkedConvert('sharingDanaSendiri', (v) => v),
          SDS: $checkedConvert('SDS', (v) => v),
          nilaiTransaksi: $checkedConvert('nilaiTransaksi', (v) => v),
          maksimalKredit: $checkedConvert('maksimalKredit', (v) => v),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelKalkulasiKreditToJson(
        _$_RitelKalkulasiKredit instance) =>
    <String, dynamic>{
      'prakarsaId': instance.prakarsaId,
      'tipeKalkulasi': instance.tipeKalkulasi,
      'nilaiProyek': instance.nilaiProyek,
      'asumsiPPN': instance.asumsiPPN,
      'nilaiProyekSetelahPPN': instance.nilaiProyekSetelahPPN,
      'asumsiLaba': instance.asumsiLaba,
      'biayaProyekNetto': instance.biayaProyekNetto,
      'sharingDanaSendiri': instance.sharingDanaSendiri,
      'SDS': instance.SDS,
      'nilaiTransaksi': instance.nilaiTransaksi,
      'maksimalKredit': instance.maksimalKredit,
    };
