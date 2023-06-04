// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_prakarsa_informasi_pengurus_pemilik.freezed.dart';
part 'ritel_prakarsa_informasi_pengurus_pemilik.g.dart';

@freezed
class RitelPrakarsaInformasiPengurusPemilik
    with _$RitelPrakarsaInformasiPengurusPemilik {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaInformasiPengurusPemilik({
    bool? status,
  }) = _RitelPrakarsaInformasiPengurusPemilik;

  factory RitelPrakarsaInformasiPengurusPemilik.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelPrakarsaInformasiPengurusPemilikFromJson(json);
}
