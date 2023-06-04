// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_screening_header.dart';

part 'ritel_screening_result.freezed.dart';
part 'ritel_screening_result.g.dart';

@freezed
class RitelScreeningResult with _$RitelScreeningResult {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelScreeningResult({
    RitelScreeningHeader? header,
    dynamic screeningSummary,
  }) = _RitelScreeningResult;

  factory RitelScreeningResult.fromJson(Map<String, dynamic> json) =>
      _$RitelScreeningResultFromJson(json);
}
