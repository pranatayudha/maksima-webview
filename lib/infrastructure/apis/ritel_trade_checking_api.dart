// ignore_for_file: always_declare_return_types

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/app/constants/common.dart';
import '../../application/models/ritel_trade_checking.dart';
import '../../application/services/local_db_service.dart';

class RitelTradeCheckingAPI {
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

  Future<Either<String, RitelTradeChecking>> fetchTradeChecking({
    required String prakarsaId,
    required int codeTable,
  }) async {
    try {
      final String url;
      url = codeTable == Common.CodeTable.PT
          ? '${F.variables['maksimaURL']}/v1/pt/prakarsa/trade-checking/detail/$prakarsaId'
          : '${F.variables['maksimaURL']}/v1/cv/prakarsa/trade-checking/detail/$prakarsaId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelTradeChecking.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }
}
