// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_legalitas_usaha_utama.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelLegalitasUsahaUtama _$$_RitelLegalitasUsahaUtamaFromJson(Map json) =>
    $checkedCreate(
      r'_$_RitelLegalitasUsahaUtama',
      json,
      ($checkedConvert) {
        final val = _$_RitelLegalitasUsahaUtama(
          type: $checkedConvert('type', (v) => v as String?),
          number: $checkedConvert('number', (v) => v as String?),
          path: $checkedConvert('path', (v) => v as String?),
          dateOfDocument:
              $checkedConvert('dateOfDocument', (v) => v as String?),
          fileType: $checkedConvert('fileType', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelLegalitasUsahaUtamaToJson(
        _$_RitelLegalitasUsahaUtama instance) =>
    <String, dynamic>{
      'type': instance.type,
      'number': instance.number,
      'path': instance.path,
      'dateOfDocument': instance.dateOfDocument,
      'fileType': instance.fileType,
    };
