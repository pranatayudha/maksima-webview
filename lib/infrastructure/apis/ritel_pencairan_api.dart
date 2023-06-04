import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../application/services/local_db_service.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';

class RitelPencairanAPI {
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

  Future<Either<String, bool>> addPencairan(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String addPencairanURL =
          '${F.variables['maksimaURL']}/v1/pr/monitoring/debitur/pencairan/add';

      final res = await _dio.post(
        addPencairanURL,
        data: payload,
        options: options(),
      );

      // ignore: prefer-conditional-expressions
      if (res.data['success'] != true) {
        return Left(res.data['message']);
      } else {
        return Right(res.data['success']);
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, bool>> revisiPencairan(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String revisiPencairanURL =
          '${F.variables['maksimaURL']}/v1/pr/monitoring/debitur/pencairan/revisi';

      final res = await _dio.put(
        revisiPencairanURL,
        data: payload,
        options: options(),
      );

      // ignore: prefer-conditional-expressions
      if (res.data['success'] != true) {
        return Left(res.data['message']);
      } else {
        return Right(res.data['success']);
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }
}
