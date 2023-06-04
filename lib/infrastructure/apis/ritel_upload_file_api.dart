import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/app/constants/common.dart';
import '../../application/helpers/get_file_name.dart';
import '../../application/services/local_db_service.dart';

import 'dart:developer' as dev;

class RitelUploadFileAPI {
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

  Future<Either<String, String>> uploadFile({
    required File file,
    required String type,
    required String subType,
  }) async {
    try {
      final String uploadFileUrl = '${F.variables['maksimaURL']}/v1/pr/upload';

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: getFilename(file),
          contentType: MediaType(type, subType),
        ),
      });

      final res = await _dio.post(
        uploadFileUrl,
        data: formData,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['data']['url'] as String);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> uploadFiles({
    required PlatformFile file,
  }) async {
    try {
      final String uploadFileUrl = '${F.variables['maksimaURL']}/v1/pr/upload';
      List<int> bytes = file.bytes!.cast();
      String type = '';
      String subType = file.extension ?? '';
      if (file.extension == 'pdf') {
        type = 'application';
      } else {
        type = 'image';
      }

      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          bytes,
          filename: file.name,
          contentType: MediaType(type, subType),
        ),
      });

      final res = await _dio.post(
        uploadFileUrl,
        data: formData,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['data']['url'] as String);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> uploadFileTwo({
    required File file,
    required String type,
    required String subType,
    required String oldPath,
  }) async {
    try {
      final String uploadFileUrl =
          '${F.variables['maksimaURL']}/v1/pr/upload/new-test';

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: getFilename(file),
          contentType: MediaType(type, subType),
        ),
        'oldPath': oldPath,
      });

      final res = await _dio.post(
        uploadFileUrl,
        data: formData,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['data']['url'] as String);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  // ignore: long-parameter-list
  Future<Either<String, int>> uploadDokumenAgunanPokok({
    required PlatformFile file,
    required String prakarsaId,
    required int jenisAgunanPokok,
    int? idAgunanPokok,
    required String prakarsaType,
  }) async {
    try {
      final String uploadFileUrl =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-pokok/upload-excel';

      List<int> bytes = file.bytes!.cast();
      String subType = file.extension ?? '';

      final formData = FormData.fromMap({
        'pathUploadExcel': await MultipartFile.fromBytes(
          bytes,
          filename: file.name,
          contentType: MediaType('application', subType),
        ),
        'prakarsaId': prakarsaId,
        'jenisAgunanPokok': jenisAgunanPokok,
        'idAgunanPokok': idAgunanPokok ?? '',
      });

      final res = await _dio.post(
        uploadFileUrl,
        data: formData,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(int.parse(res.data['data']['idAgunanPokok'] as String));
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> uploadFileRiwayatProyek({
    required File file,
    required String prakarsaId,
    int? codeTable,
  }) async {
    try {
      final String uploadFileUrl;
      if (codeTable == Common.CodeTable.PT) {
        uploadFileUrl =
            '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/trade-checking/upload-excel';
      } else if (codeTable == Common.CodeTable.CV) {
        uploadFileUrl =
            '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/riwayat-project/upload-excel';
      } else {
        uploadFileUrl =
            '${F.variables['maksimaURL']}/v1/pr/prakarsa/informasi-finansial/riwayat-project/upload-excel';
      }

      final formData = codeTable == 1
          ? FormData.fromMap({
              'pathUploadExcel': await MultipartFile.fromFile(
                file.path,
                filename: getFilename(file),
                contentType: MediaType('file', 'xlsx'),
              ),
              'prakarsaId': prakarsaId,
            })
          : FormData.fromMap({
              'pathUploadExcel': await MultipartFile.fromFile(
                file.path,
                filename: getFilename(file),
                contentType: MediaType('file', 'xlsx'),
              ),
              'prakarsaId': prakarsaId,
              'summary': 'Okay',
            });

      final res = await _dio.post(
        uploadFileUrl,
        data: formData,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['message'] as String);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> uploadFileRiwayatProyekAlon({
    required PlatformFile file,
    required String prakarsaId,
    int? codeTable,
  }) async {
    try {
      final String uploadFileUrl;
      if (codeTable == Common.CodeTable.CV) {
        uploadFileUrl =
            '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/riwayat-project/upload-excel';
      } else if (codeTable == Common.CodeTable.PT) {
        uploadFileUrl =
            '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/riwayat-project/upload-excel';
      } else {
        uploadFileUrl =
            '${F.variables['maksimaURL']}/v1/pr/prakarsa/informasi-finansial/riwayat-project/upload-excel';
      }

      List<int> bytes = file.bytes!.cast();
      String subType = file.extension ?? '';

      final formData = FormData.fromMap({
        'pathUploadExcel': MultipartFile.fromBytes(
          bytes,
          filename: file.name,
          contentType: MediaType('application', subType),
        ),
        'prakarsaId': prakarsaId,
      });

      final res = await _dio.post(
        uploadFileUrl,
        data: formData,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['message'] as String);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> uploadFileTradeChecking({
    required PlatformFile file,
    required String prakarsaId,
    int? codeTable,
    required String summary,
  }) async {
    try {
      final String uploadFileUrl;

      if (codeTable == Common.CodeTable.CV) {
        uploadFileUrl =
            '${F.variables['maksimaURL']}/v1/cv/prakarsa/trade-checking/upload-excel';
      } else if (codeTable == Common.CodeTable.PT) {
        uploadFileUrl =
            '${F.variables['maksimaURL']}/v1/pt/prakarsa/trade-checking/upload-excel';
      } else {
        uploadFileUrl =
            '${F.variables['maksimaURL']}/v1/pr/prakarsa/trade-checking/upload-excel';
      }

      List<int> bytes = file.bytes!.cast();
      String subType = file.extension ?? '';
      final formData = FormData.fromMap({
        'pathUploadExcel': MultipartFile.fromBytes(
          bytes,
          filename: file.name,
          contentType: MediaType('application', subType),
        ),
        'prakarsaId': prakarsaId,
        'summary': summary,
      });

      final res = await _dio.post(
        uploadFileUrl,
        data: formData,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['message'] as String);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> uploadFileMutasiTransaksiPari({
    required PlatformFile file,
    required String prakarsaId,
  }) async {
    try {
      final String uploadFileUrl =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/finansial/mutasi-transaksi/upload-excel';

      List<int> bytes = file.bytes!.cast();
      String type = '';
      String subType = file.extension ?? '';

      final formData = FormData.fromMap({
        'pathUploadExcel': MultipartFile.fromBytes(
          bytes,
          filename: file.name,
          contentType: MediaType(type, subType),
        ),
      });

      final res = await _dio.post(
        uploadFileUrl,
        data: formData,
        options: options(),
      );

      dev.log('UPLOAD RESULT ${res.toString()}');

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['message'] as String);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }
}
