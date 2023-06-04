// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_prakarsa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelPrakarsa _$$_RitelPrakarsaFromJson(Map json) => $checkedCreate(
      r'_$_RitelPrakarsa',
      json,
      ($checkedConvert) {
        final val = _$_RitelPrakarsa(
          pipelinesId: $checkedConvert('pipelinesId', (v) => v as String?),
          codeTable: $checkedConvert('codeTable', (v) => v as int?),
          prakarsaId: $checkedConvert('prakarsaId', (v) => v as String?),
          titlePipeline: $checkedConvert('titlePipeline', (v) => v as String?),
          typePipeline: $checkedConvert('typePipeline', (v) => v as String?),
          loanAmount: $checkedConvert('loanAmount', (v) => v as String?),
          loan_typesId: $checkedConvert('loan_typesId', (v) => v as int?),
          statusPrakarsa:
              $checkedConvert('statusPrakarsa', (v) => v as String?),
          initial: $checkedConvert('initial', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelPrakarsaToJson(_$_RitelPrakarsa instance) =>
    <String, dynamic>{
      'pipelinesId': instance.pipelinesId,
      'codeTable': instance.codeTable,
      'prakarsaId': instance.prakarsaId,
      'titlePipeline': instance.titlePipeline,
      'typePipeline': instance.typePipeline,
      'loanAmount': instance.loanAmount,
      'loan_typesId': instance.loan_typesId,
      'statusPrakarsa': instance.statusPrakarsa,
      'initial': instance.initial,
    };
