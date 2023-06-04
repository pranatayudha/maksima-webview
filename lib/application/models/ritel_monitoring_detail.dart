// ignore_for_file: invalid_annotation_target, non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_monitoring_detail_header.dart';
import 'ritel_monitoring_detail_pinjaman.dart';
import 'ritel_monitoring_detail_summary.dart';

part 'ritel_monitoring_detail.freezed.dart';
part 'ritel_monitoring_detail.g.dart';

@freezed
class RitelMonitoringDetail with _$RitelMonitoringDetail {
  @JsonSerializable(anyMap: true, explicitToJson: true)
  factory RitelMonitoringDetail({
    RitelMonitoringDetailHeader? header,
    RitelMonitoringDetailSummary? summary_pinjaman,
    List<RitelMonitoringDetailPinjaman>? pinjaman,
  }) = _RitelMonitoringDetail;

  factory RitelMonitoringDetail.fromJson(Map<String, dynamic> json) =>
      _$RitelMonitoringDetailFromJson(json);
}
