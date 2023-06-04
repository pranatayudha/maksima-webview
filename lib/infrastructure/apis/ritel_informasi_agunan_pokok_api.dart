import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/helpers/dio_error_type_parser.dart';
import '../../application/models/ritel_prakarsa_agunan_pokok.dart';
import '../../application/models/ritel_prakarsa_agunan_pokok_detail.dart';
import '../../application/services/local_db_service.dart';

class RitelInformasiAgunanPokokAPI {
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

  Future downloadDokumenRincian({
    required String url,
    required String savePath,
  }) async {
    return await _dio.download(
      url,
      savePath,
      onReceiveProgress: (received, total) {
        // ignore: prefer_interpolation_to_compose_strings
        developer.log('Downloding Dokumen Rincian : ' +
            (received / total * 100).toStringAsFixed(0) +
            '%');
      },
    );
  }

  Future<Either<String, bool>> deleteAgunanPokok({
    required int id,
    required String prakarsaId,
    required String prakarsaType,
  }) async {
    try {
      final res = await _dio.delete(
        '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-pokok/delete',
        queryParameters: {
          'id': id,
          'prakarsaId': prakarsaId,
        },
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final isSuccess = res.data['success'] as bool;

      return Right(isSuccess);
    } on DioError catch (e) {
      final msg = DioErrorTypeParser.parseToCustomMessage(e);

      throw msg;
    }
  }

  Future<Either<String, bool>> saveAgunanPokok(
    Map<String, dynamic> data,
    String prakarsaType,
  ) async {
    try {
      final res = await _dio.put(
        '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-pokok/save',
        data: jsonEncode(data),
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final isSuccess = res.data['success'] as bool;

      return Right(isSuccess);
    } on DioError catch (e) {
      final msg = DioErrorTypeParser.parseToCustomMessage(e);

      return Left(msg);
    }
  }

  Future<RitelPrakarsaAgunanPokokDetail> fetchAgunanPokokDetail({
    required int id,
    required String prakarsaId,
    required String prakarsaType,
  }) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-pokok/detail',
        queryParameters: {
          'id': id,
          'prakarsaId': prakarsaId,
        },
        options: options(),
      );

      if (res.data['success'] != true) {
        throw res.data['message'] as String;
      }

      final agunanPokokDetail = RitelPrakarsaAgunanPokokDetail.fromJson(
        res.data['data'] as Map<String, dynamic>,
      );

      return agunanPokokDetail;
    } on DioError catch (e) {
      final errorMessage = DioErrorTypeParser.parseToCustomMessage(e);

      throw errorMessage;
    }
  }

  Future<List<RitelPrakarsaAgunanPokok>> fetchAgunanPokok({
    required String prakarsaId,
    required String prakarsaType,
  }) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-pokok/list/$prakarsaId',
        options: options(),
      );

      if (res.data['success'] != true) {
        throw res.data['message'] as String;
      }

      final agunanPokoks = List<RitelPrakarsaAgunanPokok>.from(
        res.data['data'].map(
          (e) => RitelPrakarsaAgunanPokok.fromJson(e as Map<String, dynamic>),
        ),
      );

      return agunanPokoks;
    } on DioError catch (e) {
      final errorMessage = DioErrorTypeParser.parseToCustomMessage(e);

      throw errorMessage;
    }
  }

  Future<bool> deleteAgunanPokokPari({
    required int id,
    required String prakarsaId,
  }) async {
    try {
      final res = await _dio.delete(
        '${F.variables['maksimaURL']}/v1/pari/prakarsa/agunan-pokok/delete',
        queryParameters: {
          'id': id,
          'prakarsaId': prakarsaId,
        },
        options: options(),
      );

      if (res.data['success'] != true) {
        throw res.data['message'] as String;
      }

      final isSuccess = res.data['success'] as bool;

      return isSuccess;
    } on DioError catch (e) {
      final msg = DioErrorTypeParser.parseToCustomMessage(e);

      throw msg;
    }
  }

  Future<Either<String, bool>> saveAgunanPokokPari(
    Map<String, dynamic> data,
  ) async {
    try {
      final res = await _dio.put(
        '${F.variables['maksimaURL']}/v1/pari/prakarsa/agunan-pokok/save',
        data: jsonEncode(data),
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final isSuccess = res.data['success'] as bool;

      return Right(isSuccess);
    } on DioError catch (e) {
      final msg = DioErrorTypeParser.parseToCustomMessage(e);

      return Left(msg);
    }
  }

  Future<RitelPrakarsaAgunanPokokDetail> fetchAgunanPokokDetailPari({
    required int id,
    required String prakarsaId,
  }) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pari/prakarsa/agunan-pokok/detail',
        queryParameters: {
          'id': id,
          'prakarsaId': prakarsaId,
        },
        options: options(),
      );

      if (res.data['success'] != true) {
        throw res.data['message'] as String;
      }

      final agunanPokokDetail = RitelPrakarsaAgunanPokokDetail.fromJson(
        res.data['data'] as Map<String, dynamic>,
      );

      return agunanPokokDetail;
    } on DioError catch (e) {
      final errorMessage = DioErrorTypeParser.parseToCustomMessage(e);

      throw errorMessage;
    }
  }

  Future<List<RitelPrakarsaAgunanPokok>> fetchAgunanPokokPari({
    required String prakarsaId,
  }) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pari/prakarsa/agunan-pokok/list/$prakarsaId',
        options: options(),
      );

      if (res.data['success'] != true) {
        throw res.data['message'] as String;
      }

      final agunanPokoks = List<RitelPrakarsaAgunanPokok>.from(
        res.data['data'].map(
          (e) => RitelPrakarsaAgunanPokok.fromJson(e as Map<String, dynamic>),
        ),
      );

      return agunanPokoks;
    } on DioError catch (e) {
      final errorMessage = DioErrorTypeParser.parseToCustomMessage(e);

      throw errorMessage;
    }
  }
}
