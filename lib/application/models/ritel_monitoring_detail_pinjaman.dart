import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_monitoring_detail_pinjaman.freezed.dart';
part 'ritel_monitoring_detail_pinjaman.g.dart';

@freezed
class RitelMonitoringDetailPinjaman with _$RitelMonitoringDetailPinjaman {
  @JsonSerializable( anyMap: true, explicitToJson: true)
  factory RitelMonitoringDetailPinjaman({
    String? nominalRitelMonitoringDetailPinjaman,
    String? tglJatuhTempoInvoice,
    dynamic kolektabilitas,
    dynamic pokok,
    dynamic bunga,
    dynamic denda,
    int? cadanganBunga,
    String? jthtempoCadanganBunga,
    dynamic totalKewajiban,
    String? statusDisburse,
  }) = _RitelMonitoringDetailPinjaman;

  factory RitelMonitoringDetailPinjaman.fromJson(Map<String, dynamic> json) =>
      _$RitelMonitoringDetailPinjamanFromJson(json);
}
