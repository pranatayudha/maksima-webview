// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_prakarsa_info_prakarsa_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelPrakarsaInfoPrakarsaHeader _$$_RitelPrakarsaInfoPrakarsaHeaderFromJson(
        Map json) =>
    $checkedCreate(
      r'_$_RitelPrakarsaInfoPrakarsaHeader',
      json,
      ($checkedConvert) {
        final val = _$_RitelPrakarsaInfoPrakarsaHeader(
          title: $checkedConvert('title', (v) => v as String?),
          pic: $checkedConvert('pic', (v) => v as String?),
          partnerships: $checkedConvert('partnerships', (v) => v as String?),
          initial: $checkedConvert('initial', (v) => v as String?),
          loan_typesId: $checkedConvert('loan_typesId', (v) => v as String?),
          status: $checkedConvert('status', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelPrakarsaInfoPrakarsaHeaderToJson(
        _$_RitelPrakarsaInfoPrakarsaHeader instance) =>
    <String, dynamic>{
      'title': instance.title,
      'pic': instance.pic,
      'partnerships': instance.partnerships,
      'initial': instance.initial,
      'loan_typesId': instance.loan_typesId,
      'status': instance.status,
    };
