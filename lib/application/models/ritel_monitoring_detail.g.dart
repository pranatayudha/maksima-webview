// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_monitoring_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelMonitoringDetail _$$_RitelMonitoringDetailFromJson(Map json) =>
    _$_RitelMonitoringDetail(
      header: json['header'] == null
          ? null
          : RitelMonitoringDetailHeader.fromJson(
              Map<String, dynamic>.from(json['header'] as Map)),
      summary_pinjaman: json['summary_pinjaman'] == null
          ? null
          : RitelMonitoringDetailSummary.fromJson(
              Map<String, dynamic>.from(json['summary_pinjaman'] as Map)),
      pinjaman: (json['pinjaman'] as List<dynamic>?)
          ?.map((e) => RitelMonitoringDetailPinjaman.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_RitelMonitoringDetailToJson(
        _$_RitelMonitoringDetail instance) =>
    <String, dynamic>{
      'header': instance.header?.toJson(),
      'summary_pinjaman': instance.summary_pinjaman?.toJson(),
      'pinjaman': instance.pinjaman?.map((e) => e.toJson()).toList(),
    };
