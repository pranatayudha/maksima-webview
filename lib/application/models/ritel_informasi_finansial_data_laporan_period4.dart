// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_informasi_finansial_data_laporan_period4.freezed.dart';
part 'ritel_informasi_finansial_data_laporan_period4.g.dart';

@freezed
class RitelFinansialDataLaporanPeriodFour
    with _$RitelFinansialDataLaporanPeriodFour {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelFinansialDataLaporanPeriodFour({
    dynamic periode1,
    dynamic periode2,
    dynamic periode3,
  }) = _RitelFinansialDataLaporanPeriodFour;

  factory RitelFinansialDataLaporanPeriodFour.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelFinansialDataLaporanPeriodFourFromJson(json);
}
