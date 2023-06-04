// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_prakarsa_perorangan.freezed.dart';
part 'ritel_prakarsa_perorangan.g.dart';

@freezed
class RitelPrakarsaPerorangan with _$RitelPrakarsaPerorangan {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaPerorangan({
    String? id,
    String? pipeline_flagId,
    String? ktpNum,
    String? fullName,
  }) = _RitelPrakarsaPerorangan;

  factory RitelPrakarsaPerorangan.fromJson(Map<String, dynamic> json) =>
      _$RitelPrakarsaPeroranganFromJson(json);
}
