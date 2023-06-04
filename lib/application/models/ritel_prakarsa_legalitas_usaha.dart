// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_prakarsa_legalitas_usaha.freezed.dart';
part 'ritel_prakarsa_legalitas_usaha.g.dart';

@freezed
class RitelPrakarsaLegalitasUsaha with _$RitelPrakarsaLegalitasUsaha {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaLegalitasUsaha({
    bool? status,
  }) = _RitelPrakarsaLegalitasUsaha;

  factory RitelPrakarsaLegalitasUsaha.fromJson(Map<String, dynamic> json) =>
      _$RitelPrakarsaLegalitasUsahaFromJson(json);
}
