import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_date_of_birth.freezed.dart';
part 'ritel_date_of_birth.g.dart';

@freezed
class RitelDateOfBirth with _$RitelDateOfBirth {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelDateOfBirth({
    String? date,
    String? newDate,
  }) = _RitelDateOfBirth;

  factory RitelDateOfBirth.fromJson(Map<String, dynamic> json) =>
      _$RitelDateOfBirthFromJson(json);
}
