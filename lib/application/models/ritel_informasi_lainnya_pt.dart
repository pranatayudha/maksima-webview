// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_tag_location.dart';

part 'ritel_informasi_lainnya_pt.freezed.dart';
part 'ritel_informasi_lainnya_pt.g.dart';

@freezed
class RitelInformasiLainnyaPt with _$RitelInformasiLainnyaPt {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelInformasiLainnyaPt({
    String? community_branchesId,
    String? cbName,
    String? etaToCB,
    String? loan_typesId,
    String? loanAmount,
    RitelTagLocation? tagLocation,
    String? dateOfVisit,
    String? purposeVisit,
    String? ratingPARI,
    String? transactionFrequency,
    String? visitResult,
    List<dynamic>? visitPath,
    String? suratPermohonanPath,
    String? createdAt,
    String? createdBy,
  }) = _RitelInformasiLainnyaPt;

  factory RitelInformasiLainnyaPt.fromJson(Map<String, dynamic> json) =>
      _$RitelInformasiLainnyaPtFromJson(json);
}
