// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_tag_location.dart';

part 'ritel_informasi_lainnya_cv.freezed.dart';
part 'ritel_informasi_lainnya_cv.g.dart';

@freezed
class RitelInformasiLainnyaCv with _$RitelInformasiLainnyaCv {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelInformasiLainnyaCv({
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
  }) = _RitelInformasiLainnyaCv;

  factory RitelInformasiLainnyaCv.fromJson(Map<String, dynamic> json) =>
      _$RitelInformasiLainnyaCvFromJson(json);
}
