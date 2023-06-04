// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_prakarsa_info_prakarsa_header.freezed.dart';
part 'ritel_prakarsa_info_prakarsa_header.g.dart';

@freezed
class RitelPrakarsaInfoPrakarsaHeader with _$RitelPrakarsaInfoPrakarsaHeader {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaInfoPrakarsaHeader({
    String? title,
    String? pic,
    String? partnerships,
    String? initial,
    String? loan_typesId,
    String? status,
  }) = _RitelPrakarsaInfoPrakarsaHeader;

  factory RitelPrakarsaInfoPrakarsaHeader.fromJson(Map<String, dynamic> json) =>
      _$RitelPrakarsaInfoPrakarsaHeaderFromJson(json);
}
