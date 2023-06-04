// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_screening_slik.freezed.dart';
part 'ritel_screening_slik.g.dart';

@freezed
class RitelScreeningSlik with _$RitelScreeningSlik {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelScreeningSlik({
    String? status,
    dynamic reason,
    dynamic path,
  }) = _RitelScreeningSlik;

  factory RitelScreeningSlik.fromJson(Map<String, dynamic> json) =>
      _$RitelScreeningSlikFromJson(json);
}
