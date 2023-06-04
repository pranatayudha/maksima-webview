// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_tag_location.dart';

part 'ritel_informasi_lainnya.freezed.dart';
part 'ritel_informasi_lainnya.g.dart';

@freezed
class RitelInformasiLainnya with _$RitelInformasiLainnya {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelInformasiLainnya({
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
    String? createdAt,
    String? createdBy,
  }) = _RitelInformasiLainnya;

  factory RitelInformasiLainnya.fromJson(Map<String, dynamic> json) =>
      _$RitelInformasiLainnyaFromJson(json);
}
