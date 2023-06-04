// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_pipeline_perorangan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelPipelinePerorangan _$$_RitelPipelinePeroranganFromJson(Map json) =>
    $checkedCreate(
      r'_$_RitelPipelinePerorangan',
      json,
      ($checkedConvert) {
        final val = _$_RitelPipelinePerorangan(
          ritelInformasiDataDiri: $checkedConvert(
              'ritelInformasiDataDiri',
              (v) => v == null
                  ? null
                  : RitelInformasiDataDiri.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          ritelInformasiUsaha: $checkedConvert(
              'ritelInformasiUsaha',
              (v) => v == null
                  ? null
                  : RitelInformasiUsaha.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          ritelInformasiLainnya: $checkedConvert(
              'ritelInformasiLainnya',
              (v) => v == null
                  ? null
                  : RitelInformasiLainnya.fromJson(
                      Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelPipelinePeroranganToJson(
        _$_RitelPipelinePerorangan instance) =>
    <String, dynamic>{
      'ritelInformasiDataDiri': instance.ritelInformasiDataDiri?.toJson(),
      'ritelInformasiUsaha': instance.ritelInformasiUsaha?.toJson(),
      'ritelInformasiLainnya': instance.ritelInformasiLainnya?.toJson(),
    };
