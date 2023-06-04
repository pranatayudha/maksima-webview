// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_tag_location.dart';

part 'ritel_prakarsa_perorangan_data_usaha.freezed.dart';
part 'ritel_prakarsa_perorangan_data_usaha.g.dart';

@freezed
class RitelPrakarsaPeroranganDataUsaha with _$RitelPrakarsaPeroranganDataUsaha {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaPeroranganDataUsaha({
    String? businessName,
    String? economy_sectorsId,
    String? economySectorsName,
    String? economy_sub_sectorsId,
    String? economySubSectorsName,
    RitelTagLocation? tagLocation,
    String? detail,
    String? postalCode,
    String? province,
    String? city,
    String? district,
    String? village,
    String? rt,
    String? rw,
    String? createdAt,
    String? createdBy,
  }) = _RitelPrakarsaPeroranganDataUsaha;

  factory RitelPrakarsaPeroranganDataUsaha.fromJson(
          Map<String, dynamic> json,) =>
      _$RitelPrakarsaPeroranganDataUsahaFromJson(json);
}
