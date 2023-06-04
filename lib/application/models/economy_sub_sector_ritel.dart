// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'economy_sub_sector_ritel.freezed.dart';
part 'economy_sub_sector_ritel.g.dart';

@freezed
class EconomySubSectorRitel with _$EconomySubSectorRitel {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory EconomySubSectorRitel({
    String? economy_sub_sectorsId,
    String? code,
    String? economySubSectorsName,
  }) = _EconomySubSectorRitel;

  factory EconomySubSectorRitel.fromJson(Map<String, dynamic> json) =>
      _$EconomySubSectorRitelFromJson(json);
}
