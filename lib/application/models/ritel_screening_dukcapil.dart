// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_screening_dukcapil.freezed.dart';
part 'ritel_screening_dukcapil.g.dart';

@freezed
class RitelScreeningDukcapil with _$RitelScreeningDukcapil {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelScreeningDukcapil({
    String? status,
    dynamic reason,
  }) = _RitelScreeningDukcapil;

  factory RitelScreeningDukcapil.fromJson(Map<String, dynamic> json) =>
      _$RitelScreeningDukcapilFromJson(json);
}
