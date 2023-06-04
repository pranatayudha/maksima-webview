// ignore_for_file: unused_import

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/models/ritel_informasi_pinjaman.dart';
import '../../application/models/ritel_kalkulasi_kredit.dart';
import '../../application/services/local_db_service.dart';
import 'dart:developer' as dev;

class RitelInformasiPinjamanAPI {
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

  Future<Either<String, RitelInformasiPinjaman>> fetchDetailInformasiPinjaman(
    String? prakarsaId,
    String prakarsaType,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/informasi-pinjaman/detail/$prakarsaId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(RitelInformasiPinjaman.fromJson(res.data['data']));
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiPinjaman>> initInformasiPinjaman(
    String? prakarsaId,
    String prakarsaType,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/informasi-pinjaman/init/$prakarsaId';

      final res = await _dio.post(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(RitelInformasiPinjaman.fromJson(res.data['data']));
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> addUpdateInformasiPinjaman(
    Map<String, dynamic> payload,
    String prakarsaType,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/informasi-pinjaman/update';

      final res = await _dio.put(
        url,
        data: payload,
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

  Future<Either<String, RitelKalkulasiKredit>> fetchKalkulasiKredit(
    String prakarsaType,
    String? prakarsaId,
    String? asumsiPerhitunganKredit,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/informasi-pinjaman/kalkulasi-kredit/$prakarsaId?asumsiPerhitunganKredit=$asumsiPerhitunganKredit';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(RitelKalkulasiKredit.fromJson(res.data['data']));
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiPinjaman>> initInformasiPinjamanPari(
    String? prakarsaId,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/informasi-pinjaman/init/$prakarsaId';

      final res = await _dio.post(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(RitelInformasiPinjaman.fromJson(res.data['data']));
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> addUpdateInformasiPinjamanPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/informasi-pinjaman/update';

      final res = await _dio.put(
        url,
        data: payload,
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

  Future<Either<String, RitelKalkulasiKredit>> fetchKalkulasiKreditPari(
    String? prakarsaId,
    String? asumsiPerhitunganKredit,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/informasi-pinjaman/kalkulasi-kredit/$prakarsaId?asumsiPerhitunganKredit=$asumsiPerhitunganKredit';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(RitelKalkulasiKredit.fromJson(res.data['data']));
    } on DioError catch (e) {
      return Left(e.message);
    }
  }
}
