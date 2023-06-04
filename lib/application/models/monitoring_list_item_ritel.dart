// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_list_item_ritel.freezed.dart';

part 'monitoring_list_item_ritel.g.dart';

@freezed
class MonitoringListItemRitel with _$MonitoringListItemRitel {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory MonitoringListItemRitel({
    String? idKelolaan,
    String? cif,
    String? bungaPinjaman,
    @JsonKey(name: 'pinjaman_aktif') String? pinjamanAktif,
    @JsonKey(name: 'total_pinjaman') String? totalPinjaman,
    String? namaDebitur,
    String? initial,
    String? plafond,
    int? loanType,
    String? status,
    int? activeTransaction,
    String? totalTransaction,
    String? amoutLastTransaction,
  }) = _MonitoringListItemRitel;

  factory MonitoringListItemRitel.fromJson(Map<String, dynamic> json) =>
      _$MonitoringListItemRitelFromJson(json);
}
