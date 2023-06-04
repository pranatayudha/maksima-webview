// ignore_for_file: prefer-conditional-expressions

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/models/ritel_informasi_lainnya_cv.dart';
import '../../application/models/ritel_informasi_pengurus_cv.dart';
import '../../application/models/ritel_informasi_perusahaan_cv.dart';
import '../../application/models/ritel_pipelines.dart';
import '../../application/models/ritel_stepper_perusahaan_pipeline.dart';
import '../../application/services/local_db_service.dart';

import 'dart:developer' as dev;

class RitelPipelinePerusahaanCvAPI {
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

  Future<Either<String, Map<String, dynamic>>> addInformasiPerusahaanCv(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String addInformasiPerusahaanCvUrl =
          '${F.variables['maksimaURL']}/v1/pr/cv/pipeline/add';

      final res = await _dio.post(
        addInformasiPerusahaanCvUrl,
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

  Future<Either<String, Map<String, dynamic>>> updateInformasiPerusahaanCv({
    required Map<String, dynamic> payload,
    required String id,
  }) async {
    try {
      final String updateInformasiPerusahaanCvUrl =
          '${F.variables['maksimaURL']}/v1/pr/cv/pipeline/update/$id';

      final res = await _dio.put(
        updateInformasiPerusahaanCvUrl,
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

  Future<Either<String, Map<String, String>>> addPengurusCv(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String addPengurusCvUrl =
          '${F.variables['maksimaURL']}/v1/pr/cv/pipeline-management/add';

      final res = await _dio.post(
        addPengurusCvUrl,
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

  Future<Either<String, Map<String, String>>> updateInformasiPengurusCv(
    Map<String, dynamic> payload,
    int id,
  ) async {
    dev.log(payload.toString());
    try {
      final String updateInformasiUsahaUrl =
          '${F.variables['maksimaURL']}/v1/pr/cv/pipeline-management/update/$id';

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
          '${F.variables['maksimaURL']}/v1/pr/cv/pipeline-more-info/update';

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
    // String id,
  ) async {
    try {
      final String updateInformasiLainnya =
          '${F.variables['maksimaURL']}/v1/pr/cv/pipeline-more-info/update';

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
          '${F.variables['maksimaURL']}/v1/pr/cv/pipeline-save/$id';

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
          '${F.variables['maksimaURL']}/v1/pari/cv/save/$id';

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
          'informasi_perusahaan': RitelInformasiPerusahaanCV.fromJson(
            res.data['data'][0] as Map<String, dynamic>,
          ),
          'informasi_pengurus': res.data['data'][1] != null
              ? List<RitelInformasiPengurusCV>.from(
                  res.data['data'][1].map(
                    (i) => RitelInformasiPengurusCV.fromJson(
                      i as Map<String, dynamic>,
                    ),
                  ) as Iterable<dynamic>,
                )
              : null,
          'informasi_lainnya': res.data['data'][2] != null
              ? RitelInformasiLainnyaCv.fromJson(
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

  Future<Either<String, RitelInformasiPerusahaanCV>> getInformasiPerushaanCv(
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

      dev.log(res.data['data'][0].toString());

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      } else {
        return Right(
          RitelInformasiPerusahaanCV.fromJson(
            res.data['data'][0] as Map<String, dynamic>,
          ),
        );
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<RitelInformasiPengurusCV>>> getInformasiPengurusCv(
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
          List<RitelInformasiPengurusCV>.from(
            res.data['data'][1].map(
              (i) =>
                  RitelInformasiPengurusCV.fromJson(i as Map<String, dynamic>),
            ) as Iterable<dynamic>,
          ),
        );
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiLainnyaCv>> getInformasiLainnya(
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
          RitelInformasiLainnyaCv.fromJson(
            res.data['data'][2] as Map<String, dynamic>,
          ),
        );
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelStepperPerusahaanModel>> getStepperPipelineCVMenu(
    String id,
  ) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pr/cv/pipeline/stepper/$id',
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(RitelStepperPerusahaanModel.fromJson(res.data['data']));
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, dynamic>> getListPengurusPemilikCvPipelineAPI(
    String id,
    int codeTable,
  ) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pr/pipeline?codeTable=$codeTable&pipelinesId=$id',
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['data'][1]);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> savePengurusPipelineCV(
    String id,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/cv/pipeline-management/save/$id';

      final res = await _dio.put(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message']);
      }
      // ignore: newline-before-return
      return Right(res.data['message']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }
}
