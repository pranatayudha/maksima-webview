// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_prakarsa_informasi_finansial.freezed.dart';
part 'ritel_prakarsa_informasi_finansial.g.dart';

@freezed
class RitelPrakarsaInformasiFinansial with _$RitelPrakarsaInformasiFinansial {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaInformasiFinansial({
    bool? status,
  }) = _RitelPrakarsaInformasiFinansial;

  factory RitelPrakarsaInformasiFinansial.fromJson(Map<String, dynamic> json) =>
      _$RitelPrakarsaInformasiFinansialFromJson(json);
}
