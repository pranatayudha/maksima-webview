// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_tag_location.dart';

part 'ritel_informasi_usaha.freezed.dart';
part 'ritel_informasi_usaha.g.dart';

@freezed
class RitelInformasiUsaha with _$RitelInformasiUsaha {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelInformasiUsaha({
    String? addressIdParent,
    String? addressIdChild,
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
    String? createdAt,
    String? createdBy,
  }) = _RitelInformasiUsaha;

  factory RitelInformasiUsaha.fromJson(Map<String, dynamic> json) =>
      _$RitelInformasiUsahaFromJson(json);
}
