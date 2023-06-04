// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_informasi_pengurus_cv.freezed.dart';
part 'ritel_informasi_pengurus_cv.g.dart';

@freezed
class RitelInformasiPengurusCV with _$RitelInformasiPengurusCV {
  @JsonSerializable(explicitToJson: true)
  const factory RitelInformasiPengurusCV({
    String? id,
    String? cv_pipelinesId,
    String? ktpNum,
    String? npwpNum,
    String? fullName,
    String? gender,
    String? dateOfBirth,
    String? placeOfBirth,
    String? maritalStatus,
    TagLocation? tagLocation,
    String? detail,
    String? postalCode,
    String? province,
    String? city,
    String? district,
    String? village,
    String? rt,
    String? rw,
    String? phoneNum,
    String? email,
    String? spouseFullname,
    String? spouseKtpNum,
    String? spouseDateOfBirth,
    String? spousePlaceOfBirth,
    String? ktpPath,
    String? npwpPath,
    String? ktpSelfiePath,
    String? spouseKtpPath,
    String? kkPath,
    String? marriagePath,
    String? divorcePath,
    String? deathCertificatePath,
    String? createdAt,
    String? createdBy,
    int? jobCode,
    String? jobDescription,
    bool? stepper,
  }) = _RitelInformasiPengurusCV;


  factory RitelInformasiPengurusCV.fromJson(Map<String, dynamic> json) =>
      _$RitelInformasiPengurusCVFromJson(json);
}

@freezed
class TagLocation with _$TagLocation {
  @JsonSerializable(explicitToJson: true)
  const factory TagLocation({
    String? latLng,
    String? name,
  }) = _TagLocation;



  factory TagLocation.fromJson(Map<String, dynamic> json) =>
      _$TagLocationFromJson(json);
}