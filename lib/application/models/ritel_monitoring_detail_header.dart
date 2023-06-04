import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_monitoring_detail_header.freezed.dart';
part 'ritel_monitoring_detail_header.g.dart';

@freezed
class RitelMonitoringDetailHeader with _$RitelMonitoringDetailHeader {
  @JsonSerializable(anyMap: true, explicitToJson: true)
  factory RitelMonitoringDetailHeader({
    String? namaDebitur,
    String? initial,
    int? idKelolaan,
    String? bisniName,
    String? phonenum,
    String? partner,
    int? loanType,
  }) = _RitelMonitoringDetailHeader;

  factory RitelMonitoringDetailHeader.fromJson(Map<String, dynamic> json) =>
      _$RitelMonitoringDetailHeaderFromJson(json);
}
