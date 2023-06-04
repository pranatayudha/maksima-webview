// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_informasi_lainnya_pt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelInformasiLainnyaPt _$$_RitelInformasiLainnyaPtFromJson(Map json) =>
    $checkedCreate(
      r'_$_RitelInformasiLainnyaPt',
      json,
      ($checkedConvert) {
        final val = _$_RitelInformasiLainnyaPt(
          community_branchesId:
              $checkedConvert('community_branchesId', (v) => v as String?),
          cbName: $checkedConvert('cbName', (v) => v as String?),
          etaToCB: $checkedConvert('etaToCB', (v) => v as String?),
          loan_typesId: $checkedConvert('loan_typesId', (v) => v as String?),
          loanAmount: $checkedConvert('loanAmount', (v) => v as String?),
          tagLocation: $checkedConvert(
              'tagLocation',
              (v) => v == null
                  ? null
                  : RitelTagLocation.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          dateOfVisit: $checkedConvert('dateOfVisit', (v) => v as String?),
          purposeVisit: $checkedConvert('purposeVisit', (v) => v as String?),
          ratingPARI: $checkedConvert('ratingPARI', (v) => v as String?),
          transactionFrequency:
              $checkedConvert('transactionFrequency', (v) => v as String?),
          visitResult: $checkedConvert('visitResult', (v) => v as String?),
          visitPath: $checkedConvert('visitPath', (v) => v as List<dynamic>?),
          suratPermohonanPath:
              $checkedConvert('suratPermohonanPath', (v) => v as String?),
          createdAt: $checkedConvert('createdAt', (v) => v as String?),
          createdBy: $checkedConvert('createdBy', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelInformasiLainnyaPtToJson(
        _$_RitelInformasiLainnyaPt instance) =>
    <String, dynamic>{
      'community_branchesId': instance.community_branchesId,
      'cbName': instance.cbName,
      'etaToCB': instance.etaToCB,
      'loan_typesId': instance.loan_typesId,
      'loanAmount': instance.loanAmount,
      'tagLocation': instance.tagLocation?.toJson(),
      'dateOfVisit': instance.dateOfVisit,
      'purposeVisit': instance.purposeVisit,
      'ratingPARI': instance.ratingPARI,
      'transactionFrequency': instance.transactionFrequency,
      'visitResult': instance.visitResult,
      'visitPath': instance.visitPath,
      'suratPermohonanPath': instance.suratPermohonanPath,
      'createdAt': instance.createdAt,
      'createdBy': instance.createdBy,
    };
