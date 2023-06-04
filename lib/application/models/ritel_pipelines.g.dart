// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_pipelines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelPipelines _$$_RitelPipelinesFromJson(Map json) => $checkedCreate(
      r'_$_RitelPipelines',
      json,
      ($checkedConvert) {
        final val = _$_RitelPipelines(
          pipelinesId: $checkedConvert('pipelinesId', (v) => v as String?),
          codeTable: $checkedConvert('codeTable', (v) => v as int?),
          titlePipeline: $checkedConvert('titlePipeline', (v) => v as String?),
          typePipeline: $checkedConvert('typePipeline', (v) => v as String?),
          loanAmount: $checkedConvert('loanAmount', (v) => v as String?),
          loan_typesId: $checkedConvert('loan_typesId', (v) => v as int?),
          statusScreening:
              $checkedConvert('statusScreening', (v) => v as String?),
          initial: $checkedConvert('initial', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelPipelinesToJson(_$_RitelPipelines instance) =>
    <String, dynamic>{
      'pipelinesId': instance.pipelinesId,
      'codeTable': instance.codeTable,
      'titlePipeline': instance.titlePipeline,
      'typePipeline': instance.typePipeline,
      'loanAmount': instance.loanAmount,
      'loan_typesId': instance.loan_typesId,
      'statusScreening': instance.statusScreening,
      'initial': instance.initial,
    };
