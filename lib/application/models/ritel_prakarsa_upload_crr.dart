// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_prakarsa_upload_crr.freezed.dart';
part 'ritel_prakarsa_upload_crr.g.dart';

@freezed
class RitelPrakarsaUploadCRR with _$RitelPrakarsaUploadCRR {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaUploadCRR({
    bool? status,
  }) = _RitelPrakarsaUploadCRR;

  factory RitelPrakarsaUploadCRR.fromJson(Map<String, dynamic> json) =>
      _$RitelPrakarsaUploadCRRFromJson(json);
}
