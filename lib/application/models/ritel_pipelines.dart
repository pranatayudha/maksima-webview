// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_pipelines.freezed.dart';
part 'ritel_pipelines.g.dart';

@freezed
class RitelPipelines with _$RitelPipelines {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPipelines({
    String? pipelinesId,
    int? codeTable,
    String? titlePipeline,
    String? typePipeline,
    String? loanAmount,
    int? loan_typesId,
    String? statusScreening,
    String? initial,
  }) = _RitelPipelines;

  factory RitelPipelines.fromJson(Map<String, dynamic> json) =>
      _$RitelPipelinesFromJson(json);
}
