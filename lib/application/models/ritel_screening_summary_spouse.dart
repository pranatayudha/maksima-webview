import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_screening_dhn.dart';
import 'ritel_screening_dukcapil.dart';
import 'ritel_screening_slik.dart';

part 'ritel_screening_summary_spouse.freezed.dart';
part 'ritel_screening_summary_spouse.g.dart';

@freezed
class RitelScreeningSpouse with _$RitelScreeningSpouse {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelScreeningSpouse({
    RitelScreeningDHN? dhn,
    RitelScreeningDukcapil? dukcapil,
    RitelScreeningSlik? slik,
  }) = _RitelScreeningSpouse;

  factory RitelScreeningSpouse.fromJson(Map<String, dynamic> json) =>
      _$RitelScreeningSpouseFromJson(json);
}
