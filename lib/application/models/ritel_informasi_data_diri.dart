// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_date_of_birth.dart';
import 'ritel_tag_location.dart';

part 'ritel_informasi_data_diri.freezed.dart';
part 'ritel_informasi_data_diri.g.dart';

@freezed
class RitelInformasiDataDiri with _$RitelInformasiDataDiri {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelInformasiDataDiri({
    String? id,
    String? idAccountPari,
    String? ktpNum,
    String? npwpNum,
    String? fullName,
    String? gender,
    RitelDateOfBirth? dateOfBirth,
    String? dateOfExpiredKTP,
    String? dateOfIssuedKTP,
    String? placeOfBirth,
    String? motherMaiden,
    String? maritalStatus,
    String? kkNum,
    int? numberOfDependents,
    String? lastEducation,
    String? religion,
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
    String? createdAt,
    String? createdBy,
    String? typePipeline,
    String? initial,
    String? pipeline_flagId,
  }) = _RitelInformasiDataDiri;

  factory RitelInformasiDataDiri.fromJson(Map<String, dynamic> json) =>
      _$RitelInformasiDataDiriFromJson(json);
}
