// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_tag_location.dart';

part 'ritel_prakarsa_perorangan_data_usaha_pari.freezed.dart';
part 'ritel_prakarsa_perorangan_data_usaha_pari.g.dart';

@freezed
class RitelPrakarsaPeroranganDataUsahaPari
    with _$RitelPrakarsaPeroranganDataUsahaPari {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaPeroranganDataUsahaPari({
    String? businessName,
    String? jenisKomoditas,
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
    String? partnership,
    String? createdAt,
    String? createdBy,
  }) = _RitelPrakarsaPeroranganDataUsahaPari;

  factory RitelPrakarsaPeroranganDataUsahaPari.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelPrakarsaPeroranganDataUsahaPariFromJson(json);
}
