// ignore_for_file: always_declare_return_types

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/app/constants/common.dart';
import '../../application/models/ritel_riwayat_projek.dart';
import '../../application/services/local_db_service.dart';

class RitelRiwayatProyekAPI {
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

  Future<Either<String, RitelRiwayatProjek>> fetchRiwayatProyek(
    String prakarsaId,
    int codeTable,
  ) async {
    try {
      final String url;
      if (codeTable == Common.CodeTable.PT) {
        url =
            '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/riwayat-project/list/$prakarsaId';
      } else if (codeTable == Common.CodeTable.CV) {
        url =
            '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/riwayat-project/list/$prakarsaId';
      } else {
        url =
            '${F.variables['maksimaURL']}/v1/pr/prakarsa/informasi-finansial/riwayat-project/list/$prakarsaId';
      }

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelRiwayatProjek.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }
}
