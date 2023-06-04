// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_screening_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelScreeningResult _$$_RitelScreeningResultFromJson(Map json) =>
    $checkedCreate(
      r'_$_RitelScreeningResult',
      json,
      ($checkedConvert) {
        final val = _$_RitelScreeningResult(
          header: $checkedConvert(
              'header',
              (v) => v == null
                  ? null
                  : RitelScreeningHeader.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          screeningSummary: $checkedConvert('screeningSummary', (v) => v),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelScreeningResultToJson(
        _$_RitelScreeningResult instance) =>
    <String, dynamic>{
      'header': instance.header?.toJson(),
      'screeningSummary': instance.screeningSummary,
    };
