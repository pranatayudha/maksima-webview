// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_informasi_finansial_data_laporan_period4_proyeksi.freezed.dart';
part 'ritel_informasi_finansial_data_laporan_period4_proyeksi.g.dart';

@freezed
class RitelFinansialDataLaporanPeriodFourProyeksi
    with _$RitelFinansialDataLaporanPeriodFourProyeksi {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelFinansialDataLaporanPeriodFourProyeksi({
    String? proyeksiPenjualan,
    String? proyeksiHutangDagang,
    String? cerminanPenjualan,
  }) = _RitelFinansialDataLaporanPeriodFourProyeksi;

  factory RitelFinansialDataLaporanPeriodFourProyeksi.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelFinansialDataLaporanPeriodFourProyeksiFromJson(json);
}
