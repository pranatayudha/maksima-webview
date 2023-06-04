// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_legalitas_usaha.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelLegalitasUsaha _$$_RitelLegalitasUsahaFromJson(Map json) =>
    $checkedCreate(
      r'_$_RitelLegalitasUsaha',
      json,
      ($checkedConvert) {
        final val = _$_RitelLegalitasUsaha(
          mainDocument: $checkedConvert(
              'mainDocument',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => RitelLegalitasUsahaUtama.fromJson(
                      Map<String, dynamic>.from(e as Map)))
                  .toList()),
          additionalDocument: $checkedConvert(
              'additionalDocument',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => RitelLegalitasUsahaLainnya.fromJson(
                      Map<String, dynamic>.from(e as Map)))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelLegalitasUsahaToJson(
        _$_RitelLegalitasUsaha instance) =>
    <String, dynamic>{
      'mainDocument': instance.mainDocument?.map((e) => e.toJson()).toList(),
      'additionalDocument':
          instance.additionalDocument?.map((e) => e.toJson()).toList(),
    };
