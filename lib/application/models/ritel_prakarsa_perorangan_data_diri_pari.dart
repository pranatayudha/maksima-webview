// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_date_of_birth.dart';
import 'ritel_tag_location.dart';

part 'ritel_prakarsa_perorangan_data_diri_pari.freezed.dart';
part 'ritel_prakarsa_perorangan_data_diri_pari.g.dart';

@freezed
class RitelPrakarsaPeroranganDataDiriPari
    with _$RitelPrakarsaPeroranganDataDiriPari {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaPeroranganDataDiriPari({
    String? prakarsaId,
    String? id,
    String? idAccountPari,
    String? pipeline_flagId,
    String? dateOfIssuedKTP,
    String? ktpNum,
    String? npwpNum,
    String? kkNum,
    String? lastEducation,
    String? religion,
    String? fullName,
    String? gender,
    int? numberOfDependents,
    RitelDateOfBirth? dateOfBirth,
    String? placeOfBirth,
    String? motherMaiden,
    String? maritalStatus,
    String? phoneNum,
    String? email,
    String? spouseKtpNum,
    String? spouseFullname,
    RitelDateOfBirth? spouseDateOfBirth,
    String? spousePlaceOfBirth,
    String? ktpPath,
    String? npwpPath,
    String? ktpSelfiePath,
    String? spouseKtpPath,
    String? kkPath,
    String? marriagePath,
    String? divorcePath,
    String? deathCertificatePath,
    RitelTagLocation? tagLocation,
    String? detail,
    String? postalCode,
    String? province,
    String? city,
    String? district,
    String? village,
    String? rt,
    String? rw,
    DateTime? createdAt,
    String? createdBy,
    String? typePipeline,
    String? initial,
  }) = _RitelPrakarsaPeroranganDataDiriPari;

  factory RitelPrakarsaPeroranganDataDiriPari.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelPrakarsaPeroranganDataDiriPariFromJson(json);
}
