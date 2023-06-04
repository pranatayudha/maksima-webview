// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_partnerships.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelPartnerships _$$_RitelPartnershipsFromJson(Map json) => $checkedCreate(
      r'_$_RitelPartnerships',
      json,
      ($checkedConvert) {
        final val = _$_RitelPartnerships(
          id: $checkedConvert('id', (v) => v as String?),
          partnerId: $checkedConvert('partnerId', (v) => v as int?),
          partnerName: $checkedConvert('partnerName', (v) => v as String?),
          picName: $checkedConvert('picName', (v) => v as String?),
          picPhone: $checkedConvert('picPhone', (v) => v as String?),
          picEmail: $checkedConvert('picEmail', (v) => v as String?),
          picJabatan: $checkedConvert('picJabatan', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelPartnershipsToJson(
        _$_RitelPartnerships instance) =>
    <String, dynamic>{
      'id': instance.id,
      'partnerId': instance.partnerId,
      'partnerName': instance.partnerName,
      'picName': instance.picName,
      'picPhone': instance.picPhone,
      'picEmail': instance.picEmail,
      'picJabatan': instance.picJabatan,
    };
