// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_prakarsa_status_pengajuan_body.dart';
import 'ritel_prakarsa_status_pengajuan_header.dart';

part 'ritel_prakarsa_status_pengajuan.freezed.dart';
part 'ritel_prakarsa_status_pengajuan.g.dart';

@freezed
class RitelPrakarsaStatusPengajuan with _$RitelPrakarsaStatusPengajuan {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaStatusPengajuan({
    RitelPrakarsaStatusPengajuanHeader? header,
    RitelPrakarsaStatusPengajuanBodyPTR? body,
  }) = _RitelPrakarsaStatusPengajuan;

  factory RitelPrakarsaStatusPengajuan.fromJson(Map<String, dynamic> json) =>
      _$RitelPrakarsaStatusPengajuanFromJson(json);
}
