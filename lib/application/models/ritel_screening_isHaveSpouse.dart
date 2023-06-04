import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_screening_isHaveSpouse.freezed.dart';
part 'ritel_screening_isHaveSpouse.g.dart';

@freezed
class RitelScreeningIsHaveSpouse with _$RitelScreeningIsHaveSpouse {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelScreeningIsHaveSpouse({
    bool? isHaveSpouse,
  }) = _RitelScreeningIsHaveSpouse;

  factory RitelScreeningIsHaveSpouse.fromJson(Map<String, dynamic> json) =>
      _$RitelScreeningIsHaveSpouseFromJson(json);
}
