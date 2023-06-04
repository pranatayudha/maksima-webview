// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_prakarsa_status_pengajuan_header.freezed.dart';
part 'ritel_prakarsa_status_pengajuan_header.g.dart';

@freezed
class RitelPrakarsaStatusPengajuanHeader
    with _$RitelPrakarsaStatusPengajuanHeader {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaStatusPengajuanHeader({
    String? title,
    String? pic,
    String? partnerships,
    String? initial,
    String? loan_typesId,
    String? status,
    int? approvalStep,
  }) = _RitelPrakarsaStatusPengajuanHeader;

  factory RitelPrakarsaStatusPengajuanHeader.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelPrakarsaStatusPengajuanHeaderFromJson(json);
}
