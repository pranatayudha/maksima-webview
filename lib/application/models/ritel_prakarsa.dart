// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_prakarsa.freezed.dart';
part 'ritel_prakarsa.g.dart';

@freezed
class RitelPrakarsa with _$RitelPrakarsa {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsa({
    String? pipelinesId,
    int? codeTable,
    String? prakarsaId,
    String? titlePipeline,
    String? typePipeline,
    String? loanAmount,
    int? loan_typesId,
    String? statusPrakarsa,
    String? initial,
  }) = _RitelPrakarsa;

  factory RitelPrakarsa.fromJson(Map<String, dynamic> json) =>
      _$RitelPrakarsaFromJson(json);
}
