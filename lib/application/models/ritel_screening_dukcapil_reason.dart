// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_screening_dukcapil_reason.freezed.dart';
part 'ritel_screening_dukcapil_reason.g.dart';

@freezed
class RitelScreeningDukcapilReason with _$RitelScreeningDukcapilReason {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelScreeningDukcapilReason({
    dynamic debitur,
    dynamic spouseDebitur,
  }) = _RitelScreeningDukcapilReason;

  factory RitelScreeningDukcapilReason.fromJson(Map<String, dynamic> json) =>
      _$RitelScreeningDukcapilReasonFromJson(json);
}
