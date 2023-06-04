// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_prakarsa_informasi_non_finansial.freezed.dart';
part 'ritel_prakarsa_informasi_non_finansial.g.dart';

@freezed
class RitelPrakarsaInformasiNonFinansial
    with _$RitelPrakarsaInformasiNonFinansial {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaInformasiNonFinansial({
    bool? status,
  }) = _RitelPrakarsaInformasiNonFinansial;

  factory RitelPrakarsaInformasiNonFinansial.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelPrakarsaInformasiNonFinansialFromJson(json);
}
