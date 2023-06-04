// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_prakarsa_informasi_debitur.freezed.dart';
part 'ritel_prakarsa_informasi_debitur.g.dart';

@freezed
class RitelPrakarsaInformasiDebitur with _$RitelPrakarsaInformasiDebitur {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaInformasiDebitur({
    bool? status,
  }) = _RitelPrakarsaInformasiDebitur;

  factory RitelPrakarsaInformasiDebitur.fromJson(Map<String, dynamic> json) =>
      _$RitelPrakarsaInformasiDebiturFromJson(json);
}
