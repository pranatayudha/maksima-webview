// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_screening_header.freezed.dart';
part 'ritel_screening_header.g.dart';

@freezed
class RitelScreeningHeader with _$RitelScreeningHeader {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelScreeningHeader({
    String? pipeline_flagId,
    String? pipelinesId,
    int? codeTable,
    String? resultScreening,
  }) = _RitelScreeningHeader;

  factory RitelScreeningHeader.fromJson(Map<String, dynamic> json) =>
      _$RitelScreeningHeaderFromJson(json);
}
