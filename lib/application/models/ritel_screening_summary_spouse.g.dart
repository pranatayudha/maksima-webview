// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_screening_summary_spouse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelScreeningSpouse _$$_RitelScreeningSpouseFromJson(Map json) =>
    $checkedCreate(
      r'_$_RitelScreeningSpouse',
      json,
      ($checkedConvert) {
        final val = _$_RitelScreeningSpouse(
          dhn: $checkedConvert(
              'dhn',
              (v) => v == null
                  ? null
                  : RitelScreeningDHN.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          dukcapil: $checkedConvert(
              'dukcapil',
              (v) => v == null
                  ? null
                  : RitelScreeningDukcapil.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          slik: $checkedConvert(
              'slik',
              (v) => v == null
                  ? null
                  : RitelScreeningSlik.fromJson(
                      Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelScreeningSpouseToJson(
        _$_RitelScreeningSpouse instance) =>
    <String, dynamic>{
      'dhn': instance.dhn?.toJson(),
      'dukcapil': instance.dukcapil?.toJson(),
      'slik': instance.slik?.toJson(),
    };
