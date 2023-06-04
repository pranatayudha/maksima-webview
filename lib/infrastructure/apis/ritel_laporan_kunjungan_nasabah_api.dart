import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../application/app/app.locator.dart';
import '../../application/models/ritel_laporan_kunjungan_nasabah.dart';
import '../../application/services/local_db_service.dart';
import '../../flavors.dart';

class RitelLaporanKunjunganNasabahAPI {
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

  Future<Either<String, List<RitelLaporanKunjunganNasabah>>>
      fetchLaporanKunjunganNasabah({
    required String prakarsaId,
    required String prakarsaType,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/lkn/list/$prakarsaId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      print(res.data['data']);

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final ritelLaporanKunjunganNasabah =
          List<RitelLaporanKunjunganNasabah>.from(
        res.data['data'].map(
          (i) =>
              RitelLaporanKunjunganNasabah.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(ritelLaporanKunjunganNasabah);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> addLaporanKunjunganNasabah(
    Map<String, dynamic> payload,
    String prakarsaType,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/lkn/add';

      final res = await _dio.post(
        url,
        data: payload,
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

  Future<Either<String, String>> updateLaporanKunjunganNasabah(
    Map<String, dynamic> payload,
    String prakarsaType,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/lkn/update';

      final res = await _dio.put(
        url,
        data: payload,
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

  Future<Either<String, List<RitelLaporanKunjunganNasabah>>>
      fetchLaporanKunjunganNasabahPari({
    required String prakarsaId,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/lkn/list/$prakarsaId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final ritelLaporanKunjunganNasabah =
          List<RitelLaporanKunjunganNasabah>.from(
        res.data['data'].map(
          (i) =>
              RitelLaporanKunjunganNasabah.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(ritelLaporanKunjunganNasabah);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> updateLaporanKunjunganNasabahPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/lkn/update';

      final res = await _dio.put(
        url,
        data: payload,
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

  Future<Either<String, String>> addLaporanKunjunganNasabahPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/lkn/add';

      final res = await _dio.post(
        url,
        data: payload,
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
}
