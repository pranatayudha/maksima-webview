// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_informasi_usaha.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelInformasiUsaha _$$_RitelInformasiUsahaFromJson(Map json) =>
    $checkedCreate(
      r'_$_RitelInformasiUsaha',
      json,
      ($checkedConvert) {
        final val = _$_RitelInformasiUsaha(
          addressIdParent:
              $checkedConvert('addressIdParent', (v) => v as String?),
          addressIdChild:
              $checkedConvert('addressIdChild', (v) => v as String?),
          businessName: $checkedConvert('businessName', (v) => v as String?),
          jenisKomoditas:
              $checkedConvert('jenisKomoditas', (v) => v as String?),
          economy_sectorsId:
              $checkedConvert('economy_sectorsId', (v) => v as String?),
          economySectorsName:
              $checkedConvert('economySectorsName', (v) => v as String?),
          economy_sub_sectorsId:
              $checkedConvert('economy_sub_sectorsId', (v) => v as String?),
          economySubSectorsName:
              $checkedConvert('economySubSectorsName', (v) => v as String?),
          tagLocation: $checkedConvert(
              'tagLocation',
              (v) => v == null
                  ? null
                  : RitelTagLocation.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          detail: $checkedConvert('detail', (v) => v as String?),
          postalCode: $checkedConvert('postalCode', (v) => v as String?),
          province: $checkedConvert('province', (v) => v as String?),
          city: $checkedConvert('city', (v) => v as String?),
          district: $checkedConvert('district', (v) => v as String?),
          village: $checkedConvert('village', (v) => v as String?),
          rt: $checkedConvert('rt', (v) => v as String?),
          rw: $checkedConvert('rw', (v) => v as String?),
          createdAt: $checkedConvert('createdAt', (v) => v as String?),
          createdBy: $checkedConvert('createdBy', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelInformasiUsahaToJson(
        _$_RitelInformasiUsaha instance) =>
    <String, dynamic>{
      'addressIdParent': instance.addressIdParent,
      'addressIdChild': instance.addressIdChild,
      'businessName': instance.businessName,
      'jenisKomoditas': instance.jenisKomoditas,
      'economy_sectorsId': instance.economy_sectorsId,
      'economySectorsName': instance.economySectorsName,
      'economy_sub_sectorsId': instance.economy_sub_sectorsId,
      'economySubSectorsName': instance.economySubSectorsName,
      'tagLocation': instance.tagLocation?.toJson(),
      'detail': instance.detail,
      'postalCode': instance.postalCode,
      'province': instance.province,
      'city': instance.city,
      'district': instance.district,
      'village': instance.village,
      'rt': instance.rt,
      'rw': instance.rw,
      'createdAt': instance.createdAt,
      'createdBy': instance.createdBy,
    };
