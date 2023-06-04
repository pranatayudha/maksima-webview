import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_screening_dhn.dart';
import 'ritel_screening_dukcapil.dart';
import 'ritel_screening_lpg.dart';
import 'ritel_screening_slik.dart';

part 'ritel_screening_summary_debitur.freezed.dart';
part 'ritel_screening_summary_debitur.g.dart';

@freezed
class RitelScreeningDebitur with _$RitelScreeningDebitur {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelScreeningDebitur({
    RitelScreeningLPG? lpg,
    RitelScreeningDHN? dhn,
    RitelScreeningDukcapil? dukcapil,
    RitelScreeningSlik? slik,
  }) = _RitelScreeningDebitur;

  factory RitelScreeningDebitur.fromJson(Map<String, dynamic> json) =>
      _$RitelScreeningDebiturFromJson(json);
}
