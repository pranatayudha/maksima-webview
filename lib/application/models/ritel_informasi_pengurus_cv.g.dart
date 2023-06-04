// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_informasi_pengurus_cv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelInformasiPengurusCV _$$_RitelInformasiPengurusCVFromJson(
        Map<String, dynamic> json) =>
    _$_RitelInformasiPengurusCV(
      id: json['id'] as String?,
      cv_pipelinesId: json['cv_pipelinesId'] as String?,
      ktpNum: json['ktpNum'] as String?,
      npwpNum: json['npwpNum'] as String?,
      fullName: json['fullName'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      placeOfBirth: json['placeOfBirth'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      tagLocation: json['tagLocation'] == null
          ? null
          : TagLocation.fromJson(json['tagLocation'] as Map<String, dynamic>),
      detail: json['detail'] as String?,
      postalCode: json['postalCode'] as String?,
      province: json['province'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      village: json['village'] as String?,
      rt: json['rt'] as String?,
      rw: json['rw'] as String?,
      phoneNum: json['phoneNum'] as String?,
      email: json['email'] as String?,
      spouseFullname: json['spouseFullname'] as String?,
      spouseKtpNum: json['spouseKtpNum'] as String?,
      spouseDateOfBirth: json['spouseDateOfBirth'] as String?,
      spousePlaceOfBirth: json['spousePlaceOfBirth'] as String?,
      ktpPath: json['ktpPath'] as String?,
      npwpPath: json['npwpPath'] as String?,
      ktpSelfiePath: json['ktpSelfiePath'] as String?,
      spouseKtpPath: json['spouseKtpPath'] as String?,
      kkPath: json['kkPath'] as String?,
      marriagePath: json['marriagePath'] as String?,
      divorcePath: json['divorcePath'] as String?,
      deathCertificatePath: json['deathCertificatePath'] as String?,
      createdAt: json['createdAt'] as String?,
      createdBy: json['createdBy'] as String?,
      jobCode: json['jobCode'] as int?,
      jobDescription: json['jobDescription'] as String?,
      stepper: json['stepper'] as bool?,
    );

Map<String, dynamic> _$$_RitelInformasiPengurusCVToJson(
        _$_RitelInformasiPengurusCV instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cv_pipelinesId': instance.cv_pipelinesId,
      'ktpNum': instance.ktpNum,
      'npwpNum': instance.npwpNum,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'placeOfBirth': instance.placeOfBirth,
      'maritalStatus': instance.maritalStatus,
      'tagLocation': instance.tagLocation?.toJson(),
      'detail': instance.detail,
      'postalCode': instance.postalCode,
      'province': instance.province,
      'city': instance.city,
      'district': instance.district,
      'village': instance.village,
      'rt': instance.rt,
      'rw': instance.rw,
      'phoneNum': instance.phoneNum,
      'email': instance.email,
      'spouseFullname': instance.spouseFullname,
      'spouseKtpNum': instance.spouseKtpNum,
      'spouseDateOfBirth': instance.spouseDateOfBirth,
      'spousePlaceOfBirth': instance.spousePlaceOfBirth,
      'ktpPath': instance.ktpPath,
      'npwpPath': instance.npwpPath,
      'ktpSelfiePath': instance.ktpSelfiePath,
      'spouseKtpPath': instance.spouseKtpPath,
      'kkPath': instance.kkPath,
      'marriagePath': instance.marriagePath,
      'divorcePath': instance.divorcePath,
      'deathCertificatePath': instance.deathCertificatePath,
      'createdAt': instance.createdAt,
      'createdBy': instance.createdBy,
      'jobCode': instance.jobCode,
      'jobDescription': instance.jobDescription,
      'stepper': instance.stepper,
    };

_$_TagLocation _$$_TagLocationFromJson(Map<String, dynamic> json) =>
    _$_TagLocation(
      latLng: json['latLng'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_TagLocationToJson(_$_TagLocation instance) =>
    <String, dynamic>{
      'latLng': instance.latLng,
      'name': instance.name,
    };
