// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_screening_summary_debitur.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelScreeningDebitur _$$_RitelScreeningDebiturFromJson(Map json) =>
    $checkedCreate(
      r'_$_RitelScreeningDebitur',
      json,
      ($checkedConvert) {
        final val = _$_RitelScreeningDebitur(
          lpg: $checkedConvert(
              'lpg',
              (v) => v == null
                  ? null
                  : RitelScreeningLPG.fromJson(
                      Map<String, dynamic>.from(v as Map))),
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

Map<String, dynamic> _$$_RitelScreeningDebiturToJson(
        _$_RitelScreeningDebitur instance) =>
    <String, dynamic>{
      'lpg': instance.lpg?.toJson(),
      'dhn': instance.dhn?.toJson(),
      'dukcapil': instance.dukcapil?.toJson(),
      'slik': instance.slik?.toJson(),
    };
