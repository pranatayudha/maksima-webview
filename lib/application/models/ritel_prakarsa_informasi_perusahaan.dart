// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_prakarsa_informasi_perusahaan.freezed.dart';
part 'ritel_prakarsa_informasi_perusahaan.g.dart';

@freezed
class RitelPrakarsaInformasiPerusahaan with _$RitelPrakarsaInformasiPerusahaan {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaInformasiPerusahaan({
    String? id,
    bool? status,
  }) = _RitelPrakarsaInformasiPerusahaan;

  factory RitelPrakarsaInformasiPerusahaan.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelPrakarsaInformasiPerusahaanFromJson(json);
}
