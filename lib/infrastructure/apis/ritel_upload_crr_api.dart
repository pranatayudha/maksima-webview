import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/models/detail_crr_prakarsa.dart';
import '../../application/services/local_db_service.dart';

class RitelUploadCRRAPI {
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

  Future<Either<String, String>> uploadCRR({
    required PlatformFile file,
    required String prakarsaId,
    required String prakarsaType,
  }) async {
    try {
      final String uploadFileUrl =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/upload/crr';

      List<int> bytes = file.bytes!.cast();

      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          bytes,
          filename: file.name,
          contentType: MediaType('application', 'pdf'),
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

  Future<Either<String, String>> fetchCRR({
    required String prakarsaId,
    required String prakarsaType,
  }) async {
    try {
      final String uploadFileUrl =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/upload/crr/$prakarsaId';

      final res = await _dio.get(
        uploadFileUrl,
        options: options(),
      );

      if (res.data['data'] == null) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['data'] as String);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, DetailCRRPrakarsa>> getCRRDetail({
    required String prakarsaId,
    required int codeTable,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/scoring-crr/score/$prakarsaId';
      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final result = DetailCRRPrakarsa.fromJson(res.data);

      return Right(result);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }
}
