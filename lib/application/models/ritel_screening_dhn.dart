// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_screening_dhn.freezed.dart';
part 'ritel_screening_dhn.g.dart';

@freezed
class RitelScreeningDHN with _$RitelScreeningDHN {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelScreeningDHN({
    String? status,
    String? reason,
  }) = _RitelScreeningDHN;

  factory RitelScreeningDHN.fromJson(Map<String, dynamic> json) =>
      _$RitelScreeningDHNFromJson(json);
}
