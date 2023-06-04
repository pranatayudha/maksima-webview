// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_legalitas_usaha_lainnya.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelLegalitasUsahaLainnya _$$_RitelLegalitasUsahaLainnyaFromJson(
        Map json) =>
    $checkedCreate(
      r'_$_RitelLegalitasUsahaLainnya',
      json,
      ($checkedConvert) {
        final val = _$_RitelLegalitasUsahaLainnya(
          docName: $checkedConvert('docName', (v) => v as String?),
          path: $checkedConvert('path', (v) => v as String?),
          fileType: $checkedConvert('fileType', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelLegalitasUsahaLainnyaToJson(
        _$_RitelLegalitasUsahaLainnya instance) =>
    <String, dynamic>{
      'docName': instance.docName,
      'path': instance.path,
      'fileType': instance.fileType,
    };
