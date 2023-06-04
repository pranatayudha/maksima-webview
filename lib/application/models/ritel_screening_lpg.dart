// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_screening_lpg.freezed.dart';
part 'ritel_screening_lpg.g.dart';

@freezed
class RitelScreeningLPG with _$RitelScreeningLPG {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelScreeningLPG({
    String? status,
    String? reason,
  }) = _RitelScreeningLPG;

  factory RitelScreeningLPG.fromJson(Map<String, dynamic> json) =>
      _$RitelScreeningLPGFromJson(json);
}
