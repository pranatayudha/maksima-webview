import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/models/city.dart';
import '../../application/models/community_branch_ritel.dart';
import '../../application/models/district.dart';
import '../../application/models/economy_sector_ritel.dart';
import '../../application/models/economy_sub_sector_ritel.dart';
import '../../application/models/place_of_birth.dart';
import '../../application/models/province.dart';
import '../../application/models/village.dart';
import '../../application/services/local_db_service.dart';

class RitelMasterAPI {
  final _dio = Dio();
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();

  Options options() {
    return Options(
      contentType: 'application/json',
      followRedirects: false,
      validateStatus: (status) => true,
      headers: {
        'Authorization': 'Bearer ${_localDBService.ritelGetToken()}',
        'Accept': '*/*',
      },
    );
  }

  Future<Either<String, List<EconomySectorRitel>>> getEconomySectors() async {
    try {
      final String getEconomySectorUrl =
          '${F.variables['maksimaURL']}/v1/pr/economy-sector?name=';

      final res = await _dio.get(
        getEconomySectorUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final economySectors = List<EconomySectorRitel>.from(
        res.data['data'].map(
          (i) => EconomySectorRitel.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(economySectors);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<EconomySubSectorRitel>>> getEconomySubSectors(
    String id,
  ) async {
    try {
      final String getEconomySubSectorUrl =
          '${F.variables['maksimaURL']}/v1/pr/economy-sub-sector?name=&economy_sectorsId=$id';

      final res = await _dio.get(
        getEconomySubSectorUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final economicSubSectors = List<EconomySubSectorRitel>.from(
        res.data['data'].map(
          (i) => EconomySubSectorRitel.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(economicSubSectors);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<CommunityBranchRitel>>>
      getCommunityBranches() async {
    try {
      final String getCommunityBranchUrl =
          '${F.variables['maksimaURL']}/v1/pr/community-branch?name=';

      final res = await _dio.get(
        getCommunityBranchUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final communityBranches = List<CommunityBranchRitel>.from(
        res.data['data'].map(
          (i) => CommunityBranchRitel.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(communityBranches);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<Province>>> getProvinces() async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pr/areas/province?name=',
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final provinces = List<Province>.from(
        res.data['data'].map(
          (i) => Province.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(provinces);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<City>>> getCities(String provinceCode) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pr/areas/city?provinceCode=$provinceCode&name=',
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final cities = List<City>.from(
        res.data['data'].map(
          (i) => City.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(cities);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<District>>> getDistricts(
    String provinceCode,
    String cityCode,
  ) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pr/areas/district?provinceCode=$provinceCode&cityCode=$cityCode&name=',
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final districts = List<District>.from(
        res.data['data'].map(
          (i) => District.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(districts);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<Village>>> getVillages(
    String provinceCode,
    String cityCode,
    String districtCode,
  ) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pr/areas/village?provinceCode=$provinceCode&cityCode=$cityCode&districtCode=$districtCode&name',
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final villages = List<Village>.from(
        res.data['data'].map(
          (i) => Village.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(villages);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, dynamic>> getDetailByPostalCode(
    String postalKode,
  ) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pr/areas/postal-code/first?postalCode=$postalKode',
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['data']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<PlaceOfBirth>>> getPlaceOfBirthAPI(
    String name,
  ) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pr/areas/district/place-of-birth-2?name=$name',
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final places = List<PlaceOfBirth>.from(
        res.data['data'].map(
          (i) => PlaceOfBirth.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(places);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> getPublicFile(String url) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pr/private-files?fileURL=$url',
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['data']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<String> getPublicFileWithoutEither(String url) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pr/private-files?fileURL=$url',
        options: options(),
      );

      if (res.data['success'] != true) {
        return res.data['message'] as String;
      }

      return res.data['data'];
    } on DioError catch (e) {
      return e.message;
    }
  }
}
