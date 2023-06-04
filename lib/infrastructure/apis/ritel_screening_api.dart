// ignore_for_file: prefer_const_constructors, prefer-conditional-expressions, newline-before-return

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/models/ritel_hasil_prescreening_header_cv_model.dart';
import '../../application/models/ritel_screening_header.dart';
import '../../application/services/local_db_service.dart';

class RitelScreeningAPI {
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

  Future<Either<String, bool>> runPrescreening(
    String? pipelineFlagId,
  ) async {
    try {
      final String runPrescreeningUrl =
          '${F.variables['maksimaURL']}/v1/pr/pre-screening/run/$pipelineFlagId';

      final res = await _dio.post(
        runPrescreeningUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message']);
      } else {
        return Right(res.data['success']);
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelScreeningHeader>> getScreeningHeader(
    String? pipelineFlagId,
  ) async {
    try {
      final String getScreeningDataUrl =
          '${F.variables['maksimaURL']}/v1/pr/pre-screening/data-list/$pipelineFlagId';
      final res = await _dio.get(
        getScreeningDataUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message']);
      } else {
        return Right(RitelScreeningHeader.fromJson(res.data['data']['header']));
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>> getScreeningDebitur(
    String? pipelineFlagId,
  ) async {
    try {
      final String getScreeningDataUrl =
          '${F.variables['maksimaURL']}/v1/pr/pre-screening/data-list/$pipelineFlagId';

      final res = await _dio.get(
        getScreeningDataUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message']);
      } else {
        return Right(
          res.data['data']['summaryScreening'][0] as Map<String, dynamic>,
        );
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, dynamic>> getScreeningSpouse(
    String? pipelineFlagId,
  ) async {
    try {
      final String getScreeningDataUrl =
          '${F.variables['maksimaURL']}/v1/pr/pre-screening/data-list/$pipelineFlagId';

      final res = await _dio.get(
        getScreeningDataUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message']);
      } else {
        if (res.data['data']['summaryScreening'][1] != null) {
          return Right(
            res.data['data']['summaryScreening'][1] as Map<String, dynamic>,
          );
        } else {
          return const Right('succcess');
        }
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, dynamic>> getScreeningIsHaveSpouse(
    String? pipelineFlagId,
  ) async {
    try {
      final String getScreeningDataUrl =
          '${F.variables['maksimaURL']}/v1/pr/pre-screening/data-list/$pipelineFlagId';

      final res = await _dio.get(
        getScreeningDataUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message']);
      } else {
        if (res.data['data']['summaryScreening'][1] == null) {
          return Right(false);
        } else {
          return Right(true);
        }
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> putScreeningDukcapil(
    Map<String, dynamic> paylod,
  ) async {
    try {
      final String putScreeningDukcapilDataUrl =
          '${F.variables['maksimaURL']}/v1/pr/pre-screening/dukcapil-correction';

      final res = await _dio.put(
        putScreeningDukcapilDataUrl,
        data: paylod,
        options: options(),
      );

      if (!res.data['success']) {
        return Left(res.data['message'] as String);
      }
      return Right(res.data['message'] as String);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, String>>> deleteScreening(
    String? pipelineFlagId,
  ) async {
    try {
      final String deleteScreeningDataUrl =
          '${F.variables['maksimaURL']}/v1/pr/pre-screening/delete-pipeline/$pipelineFlagId';

      final res = await _dio.delete(
        deleteScreeningDataUrl,
        options: options(),
      );

      if (!res.data['success']) {
        return Left(res.data['message'] as String);
      }

      return Right({
        'message': res.data['message'] as String,
      });
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> sendToPrakarsa(
    String? pipelineFlagId,
  ) async {
    try {
      final String sendToPrakarsaUrl =
          '${F.variables['maksimaURL']}/v1/pr/pre-screening/send-to-prakarsa/$pipelineFlagId';

      final res = await _dio.post(
        sendToPrakarsaUrl,
        options: options(),
      );

      if (!res.data['success']) {
        return Left(res.data['message']);
      }

      return Right(res.data['data']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> fetchBase64Slik(
    String link,
  ) async {
    try {
      final String url = link;

      final res = await _dio.get(
        url,
        options: options().copyWith(headers: {
          'Authorization': F.appFlavor != Flavor.PROD
              ? F.variables['maksimaBasicAuth'].toString()
              : F.variables['maksimaBasicAuthSlik'].toString(),
        }),
      );

      if (res.data['success']) {
        return Right(res.data['data'].toString());
      } else {
        return Left(res.data['message']);
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelHasilPreScreeningHeaderCV>> getScreeningCVHeader(
    String? pipelineFlagId,
  ) async {
    try {
      final String getScreeningDataUrl =
          '${F.variables['maksimaURL']}/v1/pr/pre-screening/data-list/$pipelineFlagId';
      final res = await _dio.get(
        getScreeningDataUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message']);
      }
      return Right(
        RitelHasilPreScreeningHeaderCV.fromJson(
          res.data['data']['header'],
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, dynamic>> getScreeningCV(
    String? pipelineFlagId,
  ) async {
    try {
      final String getScreeningDataUrl =
          '${F.variables['maksimaURL']}/v1/pr/pre-screening/data-list/$pipelineFlagId';
      final res = await _dio.get(
        getScreeningDataUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message']);
      }
      return Right(res.data['data']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }
}
