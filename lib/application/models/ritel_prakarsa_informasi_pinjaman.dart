// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_prakarsa_informasi_pinjaman.freezed.dart';
part 'ritel_prakarsa_informasi_pinjaman.g.dart';

@freezed
class RitelPrakarsaInformasiPinjaman with _$RitelPrakarsaInformasiPinjaman {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaInformasiPinjaman({
    bool? status,
  }) = _RitelPrakarsaInformasiPinjaman;

  factory RitelPrakarsaInformasiPinjaman.fromJson(Map<String, dynamic> json) =>
      _$RitelPrakarsaInformasiPinjamanFromJson(json);
}
