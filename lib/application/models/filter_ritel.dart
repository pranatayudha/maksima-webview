// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_ritel.freezed.dart';
part 'filter_ritel.g.dart';

@freezed
class FilterRitel with _$FilterRitel {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory FilterRitel({
    String? name,
    int? value,
    bool? status,
  }) = _FilterRitel;

  factory FilterRitel.fromJson(Map<String, dynamic> json) =>
      _$FilterRitelFromJson(json);
}
