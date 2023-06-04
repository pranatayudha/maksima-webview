// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_prakarsa_status_pengajuan_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelPrakarsaStatusPengajuanHeader
    _$$_RitelPrakarsaStatusPengajuanHeaderFromJson(Map json) => $checkedCreate(
          r'_$_RitelPrakarsaStatusPengajuanHeader',
          json,
          ($checkedConvert) {
            final val = _$_RitelPrakarsaStatusPengajuanHeader(
              title: $checkedConvert('title', (v) => v as String?),
              pic: $checkedConvert('pic', (v) => v as String?),
              partnerships:
                  $checkedConvert('partnerships', (v) => v as String?),
              initial: $checkedConvert('initial', (v) => v as String?),
              loan_typesId:
                  $checkedConvert('loan_typesId', (v) => v as String?),
              status: $checkedConvert('status', (v) => v as String?),
              approvalStep: $checkedConvert('approvalStep', (v) => v as int?),
            );
            return val;
          },
        );

Map<String, dynamic> _$$_RitelPrakarsaStatusPengajuanHeaderToJson(
        _$_RitelPrakarsaStatusPengajuanHeader instance) =>
    <String, dynamic>{
      'title': instance.title,
      'pic': instance.pic,
      'partnerships': instance.partnerships,
      'initial': instance.initial,
      'loan_typesId': instance.loan_typesId,
      'status': instance.status,
      'approvalStep': instance.approvalStep,
    };
