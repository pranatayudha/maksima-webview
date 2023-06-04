// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_informasi_finansial_menu_stepper.freezed.dart';
part 'ritel_informasi_finansial_menu_stepper.g.dart';

@freezed
class RitelFinansialMenuStepper with _$RitelFinansialMenuStepper {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelFinansialMenuStepper({
    dynamic informasiFinansial,
    dynamic mutasiRekening,
    dynamic riwayatProject,
  }) = _RitelFinansialMenuStepper;

  factory RitelFinansialMenuStepper.fromJson(Map<String, dynamic> json) =>
      _$RitelFinansialMenuStepperFromJson(json);
}
