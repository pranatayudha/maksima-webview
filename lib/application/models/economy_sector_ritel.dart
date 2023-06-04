// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'economy_sector_ritel.freezed.dart';
part 'economy_sector_ritel.g.dart';

@freezed
class EconomySectorRitel with _$EconomySectorRitel {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory EconomySectorRitel({
    String? economy_sectorsId,
    String? name,
  }) = _EconomySectorRitel;

  factory EconomySectorRitel.fromJson(Map<String, dynamic> json) =>
      _$EconomySectorRitelFromJson(json);
}
