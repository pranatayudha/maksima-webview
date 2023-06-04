// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_screening_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelScreeningHeader _$$_RitelScreeningHeaderFromJson(Map json) =>
    $checkedCreate(
      r'_$_RitelScreeningHeader',
      json,
      ($checkedConvert) {
        final val = _$_RitelScreeningHeader(
          pipeline_flagId:
              $checkedConvert('pipeline_flagId', (v) => v as String?),
          pipelinesId: $checkedConvert('pipelinesId', (v) => v as String?),
          codeTable: $checkedConvert('codeTable', (v) => v as int?),
          resultScreening:
              $checkedConvert('resultScreening', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelScreeningHeaderToJson(
        _$_RitelScreeningHeader instance) =>
    <String, dynamic>{
      'pipeline_flagId': instance.pipeline_flagId,
      'pipelinesId': instance.pipelinesId,
      'codeTable': instance.codeTable,
      'resultScreening': instance.resultScreening,
    };
