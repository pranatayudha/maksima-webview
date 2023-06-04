// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_informasi_agunan_tambahan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelInformasiAgunanTambahan _$$_RitelInformasiAgunanTambahanFromJson(
        Map json) =>
    $checkedCreate(
      r'_$_RitelInformasiAgunanTambahan',
      json,
      ($checkedConvert) {
        final val = _$_RitelInformasiAgunanTambahan(
          codeTable: $checkedConvert('codeTable', (v) => v as String?),
          id: $checkedConvert('id', (v) => v as String?),
          prakarsaId: $checkedConvert('prakarsaId', (v) => v as String?),
          status: $checkedConvert('status', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelInformasiAgunanTambahanToJson(
        _$_RitelInformasiAgunanTambahan instance) =>
    <String, dynamic>{
      'codeTable': instance.codeTable,
      'id': instance.id,
      'prakarsaId': instance.prakarsaId,
      'status': instance.status,
    };
