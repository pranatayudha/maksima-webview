import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_date_of_visit.freezed.dart';
part 'ritel_date_of_visit.g.dart';

@freezed
class RitelDateOfVisit with _$RitelDateOfVisit {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelDateOfVisit({
    String? date,
    String? newDate,
  }) = _RitelDateOfVisit;

  factory RitelDateOfVisit.fromJson(Map<String, dynamic> json) =>
      _$RitelDateOfVisitFromJson(json);
}
