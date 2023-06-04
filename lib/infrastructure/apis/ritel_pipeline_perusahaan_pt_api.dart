// ignore_for_file: prefer-conditional-expressions

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/models/city.dart';
import '../../application/models/district.dart';
import '../../application/models/province.dart';
import '../../application/models/ritel_informasi_lainnya_pt.dart';
import '../../application/models/ritel_informasi_pengurus_pt.dart';
import '../../application/models/ritel_informasi_perusahaan_pt.dart';
import '../../application/models/ritel_pipelines.dart';
import '../../application/models/ritel_stepper_perusahaan_pipeline.dart';
import '../../application/models/village.dart';
import '../../application/services/local_db_service.dart';

class RitelPipelinePerusahaanPtAPI {
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

  Future<Either<String, Map<String, dynamic>>> addInformasiPerusahaanPt(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String addInformasiPerusahaanPtUrl =
          '${F.variables['maksimaURL']}/v1/pr/pt/pipeline';

      final res = await _dio.post(
        addInformasiPerusahaanPtUrl,
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

  Future<Either<String, String>> updateInformasiPerusahaanPt({
    required Map<String, dynamic> payload,
    required String id,
  }) async {
    try {
      final String updateInformasiPerusahaanPtUrl =
          '${F.variables['maksimaURL']}/v1/pr/pt/pipeline/$id';

      final res = await _dio.put(
        updateInformasiPerusahaanPtUrl,
        data: payload,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message']);
      } else {
        return Right(
          // 'id': res.data['data']['id'],
          res.data['message'],
        );
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, String>>> addInformasiPengurusPt(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String addInformasiPengurusPtUrl =
          '${F.variables['maksimaURL']}/v1/pr/pt/pipeline-mgmt';

      final res = await _dio.post(
        addInformasiPengurusPtUrl,
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

  Future<Either<String, Map<String, String>>> updateInformasiPengurusPt(
    Map<String, dynamic> payload,
    String id,
  ) async {
    try {
      final String updateInformasiPerusahaanPtUrl =
          '${F.variables['maksimaURL']}/v1/pr/pt/pipeline-mgmt/$id';

      final res = await _dio.put(
        updateInformasiPerusahaanPtUrl,
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

  Future<Either<String, String>> addInformasiLainnyaPt(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String addInformasiLainnyaPtUrl =
          '${F.variables['maksimaURL']}/v1/pr/pt/more-info';

      final res = await _dio.put(
        addInformasiLainnyaPtUrl,
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

  Future<Either<String, String>> updateInformasiLainnyaPt(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String updateInformasiLainnyaPt =
          '${F.variables['maksimaURL']}/v1/pr/pt/more-info';

      final res = await _dio.put(
        updateInformasiLainnyaPt,
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

  Future<Either<String, Map<String, String>>> savePipeline(
    String id,
  ) async {
    try {
      final String savePipelineUrl =
          '${F.variables['maksimaURL']}/v1/pr/pt/save/$id';

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
          '${F.variables['maksimaURL']}/v1/pari/pt/save/$id';

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
          'informasi_perusahaan_pt': RitelInformasiPerusahaanPt.fromJson(
            res.data['data'][0] as Map<String, dynamic>,
          ),
          'informasi_pengurus_pt': res.data['data'][1] != null
              ? List<RitelInformasiPengurusPT>.from(
                  res.data['data'][1].map(
                    (i) => RitelInformasiPengurusPT.fromJson(
                      i as Map<String, dynamic>,
                    ),
                  ) as Iterable<dynamic>,
                )
              : null,
          'informasi_lainnya_pt': res.data['data'][2] != null
              ? RitelInformasiLainnyaPt.fromJson(
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

  Future<Either<String, RitelInformasiPerusahaanPt>> getInformasiPerushaanPt(
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
          RitelInformasiPerusahaanPt.fromJson(
            res.data['data'][0] as Map<String, dynamic>,
          ),
        );
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<RitelInformasiPengurusPT>>> getInformasiPengurusPt(
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
        return Right(List<RitelInformasiPengurusPT>.from(
          res.data['data'][1].map(
            (i) => RitelInformasiPengurusPT.fromJson(i as Map<String, dynamic>),
          ) as Iterable<dynamic>,
        ));
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiLainnyaPt>> getInformasiLainnya(
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
          RitelInformasiLainnyaPt.fromJson(
            res.data['data'][2] as Map<String, dynamic>,
          ),
        );
      }
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<Province>>> getProvinces() async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pr/areas/province?name=',
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final provinces = List<Province>.from(
        res.data['data'].map(
          (i) => Province.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(provinces);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<City>>> getCities(String provinceCode) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pr/areas/city?provinceCode=$provinceCode&name=',
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final cities = List<City>.from(
        res.data['data'].map(
          (i) => City.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(cities);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<District>>> getDistricts(
    String provinceCode,
    String cityCode,
  ) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pr/areas/district?provinceCode=$provinceCode&cityCode=$cityCode&name=',
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final districts = List<District>.from(
        res.data['data'].map(
          (i) => District.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(districts);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<Village>>> getVillages(
    String provinceCode,
    String cityCode,
    String districtCode,
  ) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pr/areas/village?provinceCode=$provinceCode&cityCode=$cityCode&districtCode=$districtCode&name',
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final villages = List<Village>.from(
        res.data['data'].map(
          (i) => Village.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(villages);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, dynamic>> getPostalCode(
    String postalKode,
  ) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pr/areas/postal-code/first?postalCode=$postalKode',
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

  Future<Either<String, RitelStepperPerusahaanModel>> getStepperPipelineMenu(
    String id,
  ) async {
    try {
      final res = await _dio.get(
        '${F.variables['maksimaURL']}/v1/pr/pt/stepper/$id',
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

  Future<Either<String, dynamic>> getListPengurusPemilikPipelineAPI(
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

  Future<Either<String, String>> savePengurusPipelinePT(
    String id,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/pt/pipeline-mgmt/save/$id';

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
