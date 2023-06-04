import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_monitoring_detail_summary.freezed.dart';
part 'ritel_monitoring_detail_summary.g.dart';

@freezed
class RitelMonitoringDetailSummary with _$RitelMonitoringDetailSummary {
  @JsonSerializable(anyMap: true, explicitToJson: true)
  factory RitelMonitoringDetailSummary({
    String? plafond,
    String? outstanding,
    dynamic kelonggaranTarik,
    dynamic pendapatanBunga,
    dynamic biayaDenda,
    dynamic totalKewajiban,
    dynamic kolektabilitas,
    String? cadanganBunga,
    String? numFasilitas,
    String? numRekSimpanan,
    String? numRekEscrow,
  }) = _RitelMonitoringDetailSummary;

  factory RitelMonitoringDetailSummary.fromJson(Map<String, dynamic> json) =>
      _$RitelMonitoringDetailSummaryFromJson(json);
}
