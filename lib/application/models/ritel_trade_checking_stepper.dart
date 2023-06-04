// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_trade_checking_stepper.freezed.dart';
part 'ritel_trade_checking_stepper.g.dart';

@freezed
class RitelTradeCheckingStepper with _$RitelTradeCheckingStepper {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelTradeCheckingStepper({
    bool? status,
  }) = _RitelTradeCheckingStepper;

  factory RitelTradeCheckingStepper.fromJson(Map<String, dynamic> json) =>
      _$RitelTradeCheckingStepperFromJson(json);
}
