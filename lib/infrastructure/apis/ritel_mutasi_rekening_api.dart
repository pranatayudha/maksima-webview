import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/app/constants/common.dart';
import '../../application/models/RitelMutasiRekeningHeader.dart';
import '../../application/services/local_db_service.dart';

class RitelMutasiRekeningAPI {
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

  Future<Either<String, dynamic>> fetchMutasiRekening(
    String prakarsaId,
    int codeTable,
  ) async {
    try {
      final String url;
      if (codeTable == Common.CodeTable.PT) {
        url =
            '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/mutasi-rekening/list/$prakarsaId';
      } else if (codeTable == Common.CodeTable.CV) {
        url =
            '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/mutasi-rekening/list/$prakarsaId';
      } else if (codeTable == Common.CodeTable.PARI) {
        url =
            '${F.variables['maksimaURL']}/v1/pari/prakarsa/finansial/mutasi-rekening/list/$prakarsaId';
      } else {
        url =
            '${F.variables['maksimaURL']}/v1/pr/prakarsa/finansial/mutasi-rekening/list/$prakarsaId';
      }

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(codeTable == Common.CodeTable.Perorangan
          ? res.data['data']
          : res.data['data']['body']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelMutasiRekeningHeader>> fetchMutasiRekeningHeader(
    String prakarsaId,
    int codeTable,
  ) async {
    try {
      String? url;
      if (codeTable == Common.CodeTable.PT) {
        url =
            '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/mutasi-rekening/list/$prakarsaId';
      }

      if (codeTable == Common.CodeTable.CV) {
        url =
            '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/mutasi-rekening/list/$prakarsaId';
      }

      if (codeTable == Common.CodeTable.PARI) {
        url =
            '${F.variables['maksimaURL']}/v1/pari/prakarsa/finansial/mutasi-rekening/list/$prakarsaId';
      }

      final res = await _dio.get(
        url!,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelMutasiRekeningHeader.fromJson(res.data['data']['header']),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> addMutasiRekening(
    Map<String, dynamic> payload,
    int codeTable,
  ) async {
    try {
      final String url;
      if (codeTable == Common.CodeTable.PT) {
        url =
            '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/mutasi-rekening/add';
      } else if (codeTable == Common.CodeTable.CV) {
        url =
            '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/mutasi-rekening/add';
      } else if (codeTable == Common.CodeTable.PARI) {
        url =
            '${F.variables['maksimaURL']}/v1/pari/prakarsa/finansial/mutasi-rekening/add';
      } else {
        url =
            '${F.variables['maksimaURL']}/v1/pr/prakarsa/finansial/mutasi-rekening/add';
      }

      final res = await _dio.post(
        url,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['message']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> updateMutasiRekening(
    Map<String, dynamic> payload,
    int codeTable,
  ) async {
    try {
      final String url;

      if (codeTable == Common.CodeTable.PT) {
        url =
            '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/mutasi-rekening/update';
      } else if (codeTable == Common.CodeTable.CV) {
        url =
            '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/mutasi-rekening/update';
      } else if (codeTable == Common.CodeTable.PARI) {
        url =
            '${F.variables['maksimaURL']}/v1/pari/prakarsa/finansial/mutasi-rekening/update';
      } else {
        url =
            '${F.variables['maksimaURL']}/v1/pr/prakarsa/finansial/mutasi-rekening/update';
      }
      final res = await _dio.put(
        url,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['message']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> deleteMutasiRekening(
    Map<String, dynamic> payload,
    int codeTable,
  ) async {
    try {
      final String url;

      if (codeTable == Common.CodeTable.PT) {
        url =
            '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/mutasi-rekening/delete-mutasi';
      } else if (codeTable == Common.CodeTable.CV) {
        url =
            '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/mutasi-rekening/delete-mutasi';
      } else if (codeTable == Common.CodeTable.PARI) {
        url =
            '${F.variables['maksimaURL']}/v1/pari/prakarsa/finansial/mutasi-rekening/delete-mutasi';
      } else {
        url =
            '${F.variables['maksimaURL']}/v1/pr/prakarsa/finansial/mutasi-rekening/delete-mutasi';
      }

      final res = await _dio.delete(
        url,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['message']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> addMutasiRekeningSection(
    Map<String, dynamic> payload,
    int codeTable,
  ) async {
    try {
      final String url;
      if (codeTable == Common.CodeTable.PT) {
        url =
            '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/mutasi-rekening/add-mutasi';
      } else if (codeTable == Common.CodeTable.CV) {
        url =
            '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/mutasi-rekening/add-mutasi';
      } else if (codeTable == Common.CodeTable.PARI) {
        url =
            '${F.variables['maksimaURL']}/v1/pari/prakarsa/finansial/mutasi-rekening/add-mutasi';
      } else {
        url =
            '${F.variables['maksimaURL']}/v1/pr/prakarsa/finansial/mutasi-rekening/add-mutasi';
      }

      final res = await _dio.post(
        url,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['message']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }
}
