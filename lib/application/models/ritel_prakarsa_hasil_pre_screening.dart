// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_prakarsa_hasil_pre_screening.freezed.dart';
part 'ritel_prakarsa_hasil_pre_screening.g.dart';

@freezed
class RitelPrakarsaHasilPreScreening with _$RitelPrakarsaHasilPreScreening {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaHasilPreScreening({
    bool? status,
  }) = _RitelPrakarsaHasilPreScreening;

  factory RitelPrakarsaHasilPreScreening.fromJson(Map<String, dynamic> json) =>
      _$RitelPrakarsaHasilPreScreeningFromJson(json);
}
