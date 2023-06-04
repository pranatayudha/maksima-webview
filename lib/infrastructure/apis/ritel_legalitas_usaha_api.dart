// ignore_for_file: unused_import

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/models/ritel_legalitas_usaha.dart';
import '../../application/services/local_db_service.dart';

import 'dart:developer' as dev;

class RitelLegalitasUsahaAPI {
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

  // Perorangan

  Future<Either<String, RitelLegalitasUsaha>> fetchLegalitasUsaha(
    String prakarsaId,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/prakarsa/legalitas-usaha/list-document/$prakarsaId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelLegalitasUsaha.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> addDocument(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/prakarsa/legalitas-usaha/add-document';

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

  Future<Either<String, String>> addDocumentPT(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pt/prakarsa/legalitas-usaha/add-document';

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

  Future<Either<String, String>> updateDocument(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/prakarsa/legalitas-usaha/update-document';

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

  Future<Either<String, String>> moveDocument(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/prakarsa/legalitas-usaha/move-document';

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

  Future<Either<String, String>> deleteDocument(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/prakarsa/legalitas-usaha/delete-document';

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

  //Perusahaan PT

  Future<Either<String, RitelLegalitasUsaha>> fetchLegalitasUsahaPt(
    String prakarsaId,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pt/prakarsa/legalitas-usaha/list-document/$prakarsaId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelLegalitasUsaha.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> addDocumentPt(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pt/prakarsa/legalitas-usaha/add-document';

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

  Future<Either<String, String>> updateDocumentPt(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pt/prakarsa/legalitas-usaha/update-document';

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

  Future<Either<String, String>> moveDocumentPt(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pt/prakarsa/legalitas-usaha/move-document';

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

  Future<Either<String, String>> deleteDocumentPt(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pt/prakarsa/legalitas-usaha/delete-document';

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

  // Perusahaan CV

  Future<Either<String, RitelLegalitasUsaha>> fetchLegalitasUsahaCv(
    String prakarsaId,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/prakarsa/cv/legalitas-usaha/list-document/$prakarsaId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelLegalitasUsaha.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> addDocumentCv(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/prakarsa/cv/legalitas-usaha/add-document';

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

  Future<Either<String, String>> updateDocumentCv(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/prakarsa/cv/legalitas-usaha/update-document';

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

  Future<Either<String, String>> moveDocumentCv(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/prakarsa/cv/legalitas-usaha/move-document';

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

  Future<Either<String, String>> deleteDocumentCv(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/prakarsa/cv/legalitas-usaha/delete-document';

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

  // Pari

  Future<Either<String, RitelLegalitasUsaha>> fetchLegalitasUsahaPari(
    String prakarsaId,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/prakarsa/legalitas-usaha/list-document/$prakarsaId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelLegalitasUsaha.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> addDocumentPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/legalitas-usaha/add-document';

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

  Future<Either<String, String>> updateDocumentPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/legalitas-usaha/update-document';

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

  Future<Either<String, String>> moveDocumentPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/legalitas-usaha/move-document';

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

  Future<Either<String, String>> deleteDocumentPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/legalitas-usaha/delete-document';

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
}
