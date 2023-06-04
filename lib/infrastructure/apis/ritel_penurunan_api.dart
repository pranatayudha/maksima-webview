import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../application/services/local_db_service.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';

class RitelPenurunanAPI {
  final _dio = Dio();
  final _localDBService = locator<MaksimaLocalDBService>();

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

  Future<Either<String, bool>> addPenurunan(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String addPenurunanURL =
          '${F.variables['maksimaURL']}/v1/pr/monitoring/debitur/pencairan/penurunan';

      final res = await _dio.post(
        addPenurunanURL,
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
