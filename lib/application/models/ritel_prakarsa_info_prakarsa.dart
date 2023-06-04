// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_prakarsa_info_prakarsa_body.dart';
import 'ritel_prakarsa_info_prakarsa_header.dart';

part 'ritel_prakarsa_info_prakarsa.freezed.dart';
part 'ritel_prakarsa_info_prakarsa.g.dart';

@freezed
class RitelPrakarsaInfoPrakarsaPerorangan
    with _$RitelPrakarsaInfoPrakarsaPerorangan {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaInfoPrakarsaPerorangan({
    RitelPrakarsaInfoPrakarsaHeader? header,
    RitelPrakarsaInfoPrakarsaBodyPerorangan? body,
  }) = _RitelPrakarsaInfoPrakarsaPerorangan;

  factory RitelPrakarsaInfoPrakarsaPerorangan.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelPrakarsaInfoPrakarsaPeroranganFromJson(json);
}

@freezed
class RitelPrakarsaInfoPrakarsaPTCV with _$RitelPrakarsaInfoPrakarsaPTCV {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaInfoPrakarsaPTCV({
    RitelPrakarsaInfoPrakarsaHeader? header,
    RitelPrakarsaInfoPrakarsaBodyPTCV? body,
  }) = _RitelPrakarsaInfoPrakarsaPTCV;

  factory RitelPrakarsaInfoPrakarsaPTCV.fromJson(Map<String, dynamic> json) =>
      _$RitelPrakarsaInfoPrakarsaPTCVFromJson(json);
}
