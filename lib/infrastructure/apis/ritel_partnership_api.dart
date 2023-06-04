import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/models/ritel_partnerships.dart';
import '../../application/services/local_db_service.dart';

class RitelPartnershipAPI {
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

  Future<Either<String, RitelPartnerships>> fetchDetailBouhweer(
    String? partnerId,
  ) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/pr/monitoring/debitur/pencairan/bouwheer/detail/$partnerId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(RitelPartnerships.fromJson(res.data['data'][0]));
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<RitelPartnerships>>> fetchBouhweerList({
    int? kelolaanId,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/monitoring/debitur/pencairan/bouwheer/list?kelolaanId=$kelolaanId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final ritelPartnerShip = List<RitelPartnerships>.from(
        res.data['data'].map(
          (i) => RitelPartnerships.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(ritelPartnerShip);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, String>>> addBouhweer(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/monitoring/debitur/pencairan/bouwheer/add';

      final res = await _dio.post(
        url,
        data: payload,
        options: options(),
      );
      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right({
        'message': res.data['message'] as String,
      });

      // ignore: prefer-conditional-expressions
      // if (res.data['sucess'] == true) {
      //   return Left(res.data['message'] as String);
      // } else {
      //   // return Right(res.data['success']);

      //   return Right({
      //     'id': res.data['data']['id'],
      //     'message': res.data['message'],
      //   });
      // }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }
}
