// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'economy_sub_sector_ritel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EconomySubSectorRitel _$$_EconomySubSectorRitelFromJson(Map json) =>
    $checkedCreate(
      r'_$_EconomySubSectorRitel',
      json,
      ($checkedConvert) {
        final val = _$_EconomySubSectorRitel(
          economy_sub_sectorsId:
              $checkedConvert('economy_sub_sectorsId', (v) => v as String?),
          code: $checkedConvert('code', (v) => v as String?),
          economySubSectorsName:
              $checkedConvert('economySubSectorsName', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_EconomySubSectorRitelToJson(
        _$_EconomySubSectorRitel instance) =>
    <String, dynamic>{
      'economy_sub_sectorsId': instance.economy_sub_sectorsId,
      'code': instance.code,
      'economySubSectorsName': instance.economySubSectorsName,
    };
