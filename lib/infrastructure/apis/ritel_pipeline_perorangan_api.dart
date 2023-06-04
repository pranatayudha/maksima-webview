// ignore_for_file: prefer-conditional-expressions

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/models/ritel_informasi_data_diri.dart';
import '../../application/models/ritel_informasi_lainnya.dart';
import '../../application/models/ritel_informasi_usaha.dart';
import '../../application/models/ritel_pipelines.dart';
import '../../application/services/local_db_service.dart';

class RitelPipelinePeroranganAPI {
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

  Future<Either<String, Map<String, dynamic>>> addInformasiDataDiri(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String addInformasiDataDiriUrl =
          '${F.variables['maksimaURL']}/v1/pr/individual/pipeline/add';

      final res = await _dio.post(
        addInformasiDataDiriUrl,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message']);
      } else {
        return Right({
          'id': res.data['data']['id'],
          'message': res.data['message'],
        });
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>> updateInformasiDataDiri({
    required Map<String, dynamic> payload,
    required String id,
  }) async {
    try {
      final String updateInformasiDataDiriUrl =
          '${F.variables['maksimaURL']}/v1/pr/individual/pipeline/update/$id';

      final res = await _dio.put(
        updateInformasiDataDiriUrl,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message']);
      } else {
        return Right({
          'id': res.data['data']['id'],
          'message': res.data['message'],
        });
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>> addInformasiDataDiriPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String addInformasiDataDiriUrl =
          '${F.variables['maksimaURL']}/v1/pari/individual/pipeline/add';

      final res = await _dio.post(
        addInformasiDataDiriUrl,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message']);
      } else {
        return Right({
          'id': res.data['data']['id'],
          'message': res.data['message'],
        });
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>> updateInformasiDataDiriPari({
    required Map<String, dynamic> payload,
    required String id,
  }) async {
    try {
      final String updateInformasiDataDiriUrl =
          '${F.variables['maksimaURL']}/v1/pari/individual/pipeline/update/$id';

      final res = await _dio.put(
        updateInformasiDataDiriUrl,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message']);
      } else {
        return Right({
          'id': res.data['data']['id'],
          'message': res.data['message'],
        });
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, String>>> addInformasiUsaha(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String addInformasiUsahaUrl =
          '${F.variables['maksimaURL']}/v1/pr/individual/pipeline-business/add';

      final res = await _dio.post(
        addInformasiUsahaUrl,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right({
        'message': res.data['message'] as String,
      });
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, String>>> updateInformasiUsaha(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String updateInformasiUsahaUrl =
          '${F.variables['maksimaURL']}/v1/pr/individual/pipeline-business/update';

      final res = await _dio.put(
        updateInformasiUsahaUrl,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right({
        'message': res.data['message'] as String,
      });
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, String>>> addInformasiUsahaPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String addInformasiUsahaUrl =
          '${F.variables['maksimaURL']}/v1/pari/individual/pipeline-business/add';

      final res = await _dio.post(
        addInformasiUsahaUrl,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right({
        'message': res.data['message'] as String,
      });
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, String>>> updateInformasiUsahaPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String updateInformasiUsahaUrl =
          '${F.variables['maksimaURL']}/v1/pari/individual/pipeline-business/update';

      final res = await _dio.put(
        updateInformasiUsahaUrl,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right({
        'message': res.data['message'] as String,
      });
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, String>>> addInformasiLainnya(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String addInformasiLainnyaUrl =
          '${F.variables['maksimaURL']}/v1/pr/individual/more-info/update';

      final res = await _dio.put(
        addInformasiLainnyaUrl,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right({
        'message': res.data['message'] as String,
      });
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, String>>> updateInformasiLainnya(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String updateInformasiLainnya =
          '${F.variables['maksimaURL']}/v1/pr/individual/more-info/update';

      final res = await _dio.put(
        updateInformasiLainnya,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right({
        'message': res.data['message'] as String,
      });
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, String>>> addInformasiLainnyaPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String addInformasiLainnyaUrl =
          '${F.variables['maksimaURL']}/v1/pari/individual/more-info/update';

      final res = await _dio.put(
        addInformasiLainnyaUrl,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right({
        'message': res.data['message'] as String,
      });
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, String>>> updateInformasiLainnyaPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String updateInformasiLainnya =
          '${F.variables['maksimaURL']}/v1/pari/individual/more-info/update';

      final res = await _dio.put(
        updateInformasiLainnya,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right({
        'message': res.data['message'] as String,
      });
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, String>>> savePipeline(
    String id,
  ) async {
    try {
      final String savePipelineUrl =
          '${F.variables['maksimaURL']}/v1/pr/individual/save/$id';

      final res = await _dio.put(
        savePipelineUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right({
        'message': res.data['message'] as String,
      });
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, String>>> savePipelinePari(
    String id,
  ) async {
    try {
      final String savePipelineUrl =
          '${F.variables['maksimaURL']}/v1/pari/individual/save/$id';

      final res = await _dio.put(
        savePipelineUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right({
        'message': res.data['message'] as String,
      });
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<RitelPipelines>>> fetchPipelines({
    int? page,
    dynamic recordCount,
    String? textSearch,
    dynamic status,
  }) async {
    try {
      final String getAllUrl =
          '${F.variables['maksimaURL']}/v1/pr/pipeline/list?page=$page&limit=$recordCount&name=$textSearch&status=$status';

      final res = await _dio.get(
        getAllUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final ritelPipelines = List<RitelPipelines>.from(
        res.data['data'].map(
          (i) => RitelPipelines.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(ritelPipelines);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<RitelPipelines>>> fetchPipelinesWithoutLimit({
    int? page,
    String? textSearch,
    dynamic status,
    dynamic loanType,
  }) async {
    try {
      final String getAllUrl =
          '${F.variables['maksimaURL']}/v1/pr/pipeline/list?page=$page&name=$textSearch&status=$status&loanType=$loanType&limit=1000';

      final res = await _dio.get(
        getAllUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final ritelPipelines = List<RitelPipelines>.from(
        res.data['data'].map(
          (i) => RitelPipelines.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(ritelPipelines);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>> getById(
    String id,
    String codeTable,
  ) async {
    try {
      final String getByIdUrl =
          '${F.variables['maksimaURL']}/v1/pr/pipeline?pipelinesId=$id&codeTable=$codeTable';

      final res = await _dio.get(
        getByIdUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      } else {
        final result = {
          'informasi_data_diri': RitelInformasiDataDiri.fromJson(
            res.data['data'][0] as Map<String, dynamic>,
          ),
          'informasi_usaha': res.data['data'][1] != null
              ? RitelInformasiUsaha.fromJson(
                  res.data['data'][1] as Map<String, dynamic>,
                )
              : null,
          'informasi_lainnya': res.data['data'][2] != null
              ? RitelInformasiLainnya.fromJson(
                  res.data['data'][2] as Map<String, dynamic>,
                )
              : null,
        };

        return Right(result);
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiDataDiri>> getInformasiDataDiri(
    String id,
    int codeTable,
  ) async {
    try {
      final String getByIdUrl =
          '${F.variables['maksimaURL']}/v1/pr/pipeline?pipelinesId=$id&codeTable=$codeTable';

      final res = await _dio.get(
        getByIdUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      } else {
        return Right(
          RitelInformasiDataDiri.fromJson(
            res.data['data'][0] as Map<String, dynamic>,
          ),
        );
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiUsaha>> getInformasiUsaha(
    String id,
    int codeTable,
  ) async {
    try {
      final String getByIdUrl =
          '${F.variables['maksimaURL']}/v1/pr/pipeline?pipelinesId=$id&codeTable=$codeTable';

      final res = await _dio.get(
        getByIdUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      } else {
        return Right(
          RitelInformasiUsaha.fromJson(
            res.data['data'][1] as Map<String, dynamic>,
          ),
        );
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiLainnya>> getInformasiLainnya(
    String id,
    int codeTable,
  ) async {
    try {
      final String getByIdUrl =
          '${F.variables['maksimaURL']}/v1/pr/pipeline?pipelinesId=$id&codeTable=$codeTable';

      final res = await _dio.get(
        getByIdUrl,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      } else {
        return Right(
          RitelInformasiLainnya.fromJson(
            res.data['data'][2] as Map<String, dynamic>,
          ),
        );
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }
}
