// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_partnerships.freezed.dart';
part 'ritel_partnerships.g.dart';

@freezed
class RitelPartnerships with _$RitelPartnerships {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPartnerships({
    String? id,
    int? partnerId,
    String? partnerName,
    String? picName,
    String? picPhone,
    String? picEmail,
    String? picJabatan,
  }) = _RitelPartnerships;

  factory RitelPartnerships.fromJson(Map<String, dynamic> json) =>
      _$RitelPartnershipsFromJson(json);
}
