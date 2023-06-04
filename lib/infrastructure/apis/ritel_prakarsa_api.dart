import 'dart:developer' as dev;

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/app/constants/common.dart';
import '../../application/models/ritel_informasi_finansial_pari.dart';
import '../../application/models/ritel_informasi_pengurus_cv.dart';
import '../../application/models/ritel_informasi_pengurus_pt.dart';
import '../../application/models/ritel_informasi_perusahaan_pt.dart';
import '../../application/models/ritel_mutasi_transaksi_pari.dart';
import '../../application/models/ritel_prakarsa.dart';
import '../../application/models/ritel_prakarsa_info_prakarsa.dart';
import '../../application/models/ritel_prakarsa_perorangan.dart';
import '../../application/models/ritel_prakarsa_perorangan_data_diri.dart';
import '../../application/models/ritel_prakarsa_perorangan_data_usaha.dart';
import '../../application/models/ritel_prakarsa_perorangan_data_usaha_pari.dart';
import '../../application/models/ritel_prakarsa_revisi_adk_or_cbl.dart';
import '../../application/models/ritel_prakarsa_status_pengajuan.dart';
import '../../application/models/ritel_summary_non_finansial.dart';
import '../../application/services/local_db_service.dart';

class RitelPrakarsaAPI {
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

  Future<Either<String, List<RitelPrakarsa>>> fetchPrakarsa({
    int? page,
    dynamic recordCount,
    String? textSearch,
    dynamic status,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/prakarsa/list?page=$page&limit=$recordCount&name=$textSearch&status=$status';

      final res = await _dio.get(
        url,
        options: options(),
      );

      dev.log(res.data.toString());

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final ritelPrakarsa = List<RitelPrakarsa>.from(
        res.data['data'].map(
          (i) => RitelPrakarsa.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(ritelPrakarsa);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<RitelPrakarsa>>> fetchPrakarsaWithoutLimit({
    String? textSearch,
    dynamic status,
    dynamic loanType,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/prakarsa/list?page=1&name=$textSearch&status=$status&loanType=$loanType';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final ritelPrakarsa = List<RitelPrakarsa>.from(
        res.data['data'].map(
          (i) => RitelPrakarsa.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(ritelPrakarsa);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelPrakarsaPerorangan>> fetchById({
    String? prakarsaId,
    String? pipelineId,
    int? codeTable,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/prakarsa?prakarsaId=$prakarsaId&codeTable=$codeTable&pipelinesId=$pipelineId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final ritelPrakarsa = RitelPrakarsaPerorangan.fromJson(
        res.data['data'][0] as Map<String, dynamic>,
      );

      return Right(ritelPrakarsa);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiPerusahaanPt>>
      fetchByIdInformasiPerusahaan({
    required String prakarsaId,
    required String pipelineId,
    required int codeTable,
  }) async {
    try {
      final String url = '${F.variables['maksimaURL']}/v1/pr/prakarsa';

      final res = await _dio.get(
        url,
        options: options(),
        queryParameters: {
          'prakarsaId': prakarsaId,
          'codeTable': codeTable,
          'pipelinesId': pipelineId,
        },
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final ritelPrakarsa = RitelInformasiPerusahaanPt.fromJson(
        res.data['data'][0] as Map<String, dynamic>,
      );

      return Right(ritelPrakarsa);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> updateByIdInformasiPerusahaan({
    required Map<String, dynamic> payload,
    required int codeTable,
  }) async {
    try {
      final String url;
      url = codeTable == Common.CodeTable.CV
          ? '${F.variables['maksimaURL']}/v1/pr/prakarsa/cv/informasi-perusahaan/update'
          : '${F.variables['maksimaURL']}/v1/pt/prakarsa/informasi-perusahaan/update';

      final res = await _dio.put(
        url,
        options: options(),
        data: payload,
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['message']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<RitelInformasiPengurusPT>>>
      fetchByIdInformasiPengurusPT({
    required String prakarsaId,
    required String pipelineId,
    required int codeTable,
  }) async {
    try {
      final String url = '${F.variables['maksimaURL']}/v1/pr/prakarsa';

      final res = await _dio.get(
        url,
        options: options(),
        queryParameters: {
          'prakarsaId': prakarsaId,
          'codeTable': codeTable,
          'pipelinesId': pipelineId,
        },
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final informasiPengurusData = res.data['data'][1] as List<dynamic>;

      final informasiPengurusList = informasiPengurusData
          .map((e) => RitelInformasiPengurusPT.fromJson(e))
          .toList();

      return Right(informasiPengurusList);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, List<RitelInformasiPengurusCV>>>
      fetchByIdInformasiPengurusCV({
    required String prakarsaId,
    required String pipelineId,
    required int codeTable,
  }) async {
    try {
      final String url = '${F.variables['maksimaURL']}/v1/pr/prakarsa';

      final res = await _dio.get(
        url,
        options: options(),
        queryParameters: {
          'prakarsaId': prakarsaId,
          'codeTable': codeTable,
          'pipelinesId': pipelineId,
        },
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final informasiPengurusData = res.data['data'][1] as List<dynamic>;

      final informasiPengurusList = informasiPengurusData
          .map((e) => RitelInformasiPengurusCV.fromJson(e))
          .toList();

      return Right(informasiPengurusList);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> updateByIdInformasiPengurus({
    required Map<String, dynamic> payload,
    required int codeTable,
  }) async {
    try {
      final String url;
      url = codeTable == Common.CodeTable.CV
          ? '${F.variables['maksimaURL']}/v1/pr/prakarsa/cv/informasi-pengurus/update'
          : '${F.variables['maksimaURL']}/v1/pt/prakarsa/informasi-mgmt/update';

      final res = await _dio.put(
        url,
        options: options(),
        data: payload,
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['message']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelPrakarsaPeroranganDataDiri>> fetchByIdDataDiri({
    String? prakarsaId,
    String? pipelineId,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/prakarsa?prakarsaId=$prakarsaId&codeTable=1&pipelinesId=$pipelineId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final ritelPrakarsa = RitelPrakarsaPeroranganDataDiri.fromJson(
        res.data['data'][0] as Map<String, dynamic>,
      );

      return Right(ritelPrakarsa);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>> fetchByIdDataDiriPari({
    String? prakarsaId,
    String? pipelineId,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/prakarsa?prakarsaId=$prakarsaId&codeTable=4&pipelinesId=$pipelineId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['data'][0] as Map<String, dynamic>);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelPrakarsaPeroranganDataUsaha>> fetchByIdDataUsaha({
    String? prakarsaId,
    String? pipelineId,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/prakarsa?prakarsaId=$prakarsaId&codeTable=1&pipelinesId=$pipelineId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final ritelPrakarsa = RitelPrakarsaPeroranganDataUsaha.fromJson(
        res.data['data'][1] as Map<String, dynamic>,
      );

      return Right(ritelPrakarsa);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelPrakarsaPeroranganDataUsahaPari>>
      fetchByIdDataUsahaPari({
    String? prakarsaId,
    String? pipelineId,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/prakarsa?prakarsaId=$prakarsaId&codeTable=4&pipelinesId=$pipelineId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final ritelPrakarsa = RitelPrakarsaPeroranganDataUsahaPari.fromJson(
        res.data['data'][1] as Map<String, dynamic>,
      );

      return Right(ritelPrakarsa);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelPrakarsaStatusPengajuan>> fetchStatusPengajuan(
    String prakarsaId,
    int codeTable,
  ) async {
    // dev.log(_localDBService.ritelGetToken().toString());
    try {
      final String url;

      if (codeTable == Common.CodeTable.CV) {
        url =
            '${F.variables['maksimaURL']}/v1/pr/prakarsa/cv/status-pengajuan/$prakarsaId';
      } else if (codeTable == Common.CodeTable.PT) {
        url =
            '${F.variables['maksimaURL']}/v1/pt/prakarsa/status-pengajuan/$prakarsaId';
      } else {
        url =
            '${F.variables['maksimaURL']}/v1/pr/prakarsa/status-pengajuan/$prakarsaId';
      }

      final res = await _dio.get(
        url,
        options: options(),
      );

      dev.log(res.data.toString());

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final prakarsaStatusPengajuan = RitelPrakarsaStatusPengajuan.fromJson(
        res.data['data'] as Map<String, dynamic>,
      );

      return Right(prakarsaStatusPengajuan);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelPrakarsaInfoPrakarsaPerorangan>>
      fetchInfoPrakarsaPerorangan(String prakarsaId) async {
    try {
      final String url;

      url =
          '${F.variables['maksimaURL']}/v1/pr/prakarsa/info-prakarsa/$prakarsaId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final prakarsaInfoPrakarsa = RitelPrakarsaInfoPrakarsaPerorangan.fromJson(
        res.data['data'] as Map<String, dynamic>,
      );

      return Right(prakarsaInfoPrakarsa);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelPrakarsaInfoPrakarsaPTCV>> fetchInfoPrakarsaPTCV(
    String prakarsaId,
    int codeTable,
  ) async {
    try {
      final String url;

      url = codeTable == Common.CodeTable.CV
          ? '${F.variables['maksimaURL']}/v1/pr/prakarsa/cv/info-prakarsa/$prakarsaId'
          : '${F.variables['maksimaURL']}/v1/pt/prakarsa/info-prakarsa/$prakarsaId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final prakarsaInfoPrakarsa = RitelPrakarsaInfoPrakarsaPTCV.fromJson(
        res.data['data'] as Map<String, dynamic>,
      );

      return Right(prakarsaInfoPrakarsa);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, String>>> updateInfoDebitur(
    String prakarsaId,
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/prakarsa/individual/informasi-debitur/update/$prakarsaId';

      final res = await _dio.put(
        url,
        data: payload,
        options: options(),
      );

      if (!res.data['success']) {
        return Left(res.data['message'] as String);
      }

      return Right({
        'message': res.data['message'] as String,
      });
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, String>>> updateInfoDebiturPari(
    String prakarsaId,
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/individual/informasi-debitur/update/$prakarsaId';

      final res = await _dio.put(
        url,
        data: payload,
        options: options(),
      );

      if (!res.data['success']) {
        return Left(res.data['message'] as String);
      }

      return Right({
        'message': res.data['message'] as String,
      });
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> postPrakarsaNonFinansial(
    Map<String, dynamic> payload,
    int codeTable,
  ) async {
    try {
      final String url;
      if (codeTable == Common.CodeTable.PT) {
        url = '${F.variables['maksimaURL']}/v1/pt/prakarsa/non-finansial/add';
      } else if (codeTable == Common.CodeTable.CV) {
        url = '${F.variables['maksimaURL']}/v1/cv/prakarsa/non-finansial/add';
      } else if (codeTable == Common.CodeTable.PARI) {
        url = '${F.variables['maksimaURL']}/v1/pari/prakarsa/non-finansial/add';
      } else {
        url = '${F.variables['maksimaURL']}/v1/pr/prakarsa/non-finansial/add';
      }

      final res = await _dio.post(
        url,
        data: payload,
        options: options(),
      );

      if (!res.data['success']) {
        return Left(res.data['message'] as String);
      }

      return Right(
        res.data['message'],
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> postPrakarsaNonFinansialPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/non-finansial/add';

      final res = await _dio.post(
        url,
        data: payload,
        options: options(),
      );

      if (!res.data['success']) {
        return Left(res.data['message']);
      }

      return Right(
        res.data['message'],
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelSummaryNonFinansial>> fetchPrakarsaNonFinansial(
    String prakarsaId,
    int codeTable,
  ) async {
    try {
      final String url;
      if (codeTable == Common.CodeTable.PT) {
        url =
            '${F.variables['maksimaURL']}/v1/pt/prakarsa/non-finansial/list/$prakarsaId';
      } else if (codeTable == Common.CodeTable.CV) {
        url =
            '${F.variables['maksimaURL']}/v1/cv/prakarsa/non-finansial/list/$prakarsaId';
      } else if (codeTable == Common.CodeTable.PARI) {
        url =
            '${F.variables['maksimaURL']}/v1/pari/prakarsa/non-finansial/list/$prakarsaId';
      } else {
        url =
            '${F.variables['maksimaURL']}/v1/pr/prakarsa/non-finansial/list/$prakarsaId';
      }

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (!res.data['success']) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelSummaryNonFinansial.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>> stepperMenuInformasiFinansial(
    String id,
    int codeTable,
  ) async {
    try {
      dev.log(id);
      final String url;
      if (codeTable == Common.CodeTable.PT) {
        url =
            '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/stepper/$id';
      } else if (codeTable == Common.CodeTable.CV) {
        url =
            '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/stepper/$id';
      } else {
        url =
            '${F.variables['maksimaURL']}/v1/pr/prakarsa/informasi-finansial/stepper/$id';
      }

      final res = await _dio.get(
        url,
        options: options(),
      );

      dev.log(res.data.toString());

      if (!res.data['success']) {
        return Left(res.data['message']);
      }

      return Right(res.data['data']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>> initInformasiFinansial(
    String id,
    int codeTable,
  ) async {
    try {
      final String url;
      if (codeTable == Common.CodeTable.PT) {
        url = '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/init/$id';
      } else if (codeTable == Common.CodeTable.CV) {
        url = '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/init/$id';
      } else {
        url = '${F.variables['maksimaURL']}/v1/pr/prakarsa/finansial/init/$id';
      }

      final res = await _dio.post(
        url,
        options: options(),
      );

      return !res.data['success']
          ? Left(res.data['message'] as String)
          : Right(res.data);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>> initInformasiFinansialPari(
    String id,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/finansial/init/$id';

      final res = await _dio.post(
        url,
        options: options(),
      );

      return !res.data['success']
          ? Left(res.data['message'] as String)
          : Right(res.data);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> saveInformasiFinansial(
    Map<String, dynamic> payload,
    int codeTable,
  ) async {
    try {
      final String url;

      if (codeTable == Common.CodeTable.PT) {
        url = '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/save';
      } else if (codeTable == Common.CodeTable.CV) {
        url = '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/save';
      } else {
        url = '${F.variables['maksimaURL']}/v1/pr/prakarsa/finansial/save';
      }

      final res = await _dio.put(
        url,
        data: payload,
        options: options(),
      );


      return !res.data['success']
          ? Left(res.data['message'] as String)
          : Right(res.data['message'] as String);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> saveAsumsiInfoFinansial(
    Map<String, dynamic> payload,
    int codeTable,
  ) async {
    try {
      final String url;

      if (codeTable == Common.CodeTable.PT) {
        url = '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/asumsi';
      } else if (codeTable == Common.CodeTable.CV) {
        url = '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/asumsi';
      } else {
        url = '${F.variables['maksimaURL']}/v1/pr/prakarsa/finansial/asumsi';
      }

      final res = await _dio.put(
        url,
        data: payload,
        options: options(),
      );

      return !res.data['success']
          ? Left(res.data['message'] as String)
          : Right(res.data['message'] as String);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>> fetchInformasiFinansialPeriodOne(
    String id,
    int codeTable,
  ) async {
    try {
      final String url;

      if (codeTable == Common.CodeTable.PT) {
        url = '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/list/$id';
      } else if (codeTable == Common.CodeTable.CV) {
        url = '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/list/$id';
      } else {
        url = '${F.variables['maksimaURL']}/v1/pr/prakarsa/finansial/list/$id';
      }

      final res = await _dio.get(
        url,
        options: options(),
      );

      return res.data['success'] != true
          ? Left(res.data['message'])
          : Right(res.data['data'][0] as Map<String, dynamic>);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>> fetchInformasiFinansialPeriodTwo(
    String id,
    int codeTable,
  ) async {
    try {
      final String url;

      if (codeTable == Common.CodeTable.PT) {
        url = '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/list/$id';
      } else if (codeTable == Common.CodeTable.CV) {
        url = '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/list/$id';
      } else {
        url = '${F.variables['maksimaURL']}/v1/pr/prakarsa/finansial/list/$id';
      }

      final res = await _dio.get(
        url,
        options: options(),
      );

      return res.data['success'] != true
          ? Left(res.data['message'])
          : Right(res.data['data'][1] as Map<String, dynamic>);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>>
      fetchInformasiFinansialPeriodThree(String id, int codeTable) async {
    try {
      final String url;

      if (codeTable == Common.CodeTable.PT) {
        url = '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/list/$id';
      } else if (codeTable == Common.CodeTable.CV) {
        url = '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/list/$id';
      } else {
        url = '${F.variables['maksimaURL']}/v1/pr/prakarsa/finansial/list/$id';
      }

      final res = await _dio.get(
        url,
        options: options(),
      );

      return res.data['success'] != true
          ? Left(res.data['message'])
          : Right(res.data['data'][2] as Map<String, dynamic>);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>>
      fetchInformasiFinansialPeriodFour(String id, int codeTable) async {
    try {
      final String url;

      if (codeTable == Common.CodeTable.PT) {
        url = '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/list/$id';
      } else if (codeTable == Common.CodeTable.CV) {
        url = '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/list/$id';
      } else {
        url = '${F.variables['maksimaURL']}/v1/pr/prakarsa/finansial/list/$id';
      }

      final res = await _dio.get(
        url,
        options: options(),
      );

      return res.data['success'] != true
          ? Left(res.data['message'])
          : Right(res.data['data'][3] as Map<String, dynamic>);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> updateInformasiFinansialPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/finansial/update';

      final res = await _dio.put(
        url,
        data: payload,
        options: options(),
      );

      dev.log(res.data.toString());

      return !res.data['success']
          ? Left(res.data['message'] as String)
          : Right(res.data['message'] as String);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> saveInformasiFinansialPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/finansial/save';

      final res = await _dio.post(
        url,
        data: payload,
        options: options(),
      );

      dev.log(res.data.toString());

      return !res.data['success']
          ? Left(res.data['message'] as String)
          : Right(res.data['message'] as String);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  // Nanda Hasyim M
  Future<Either<String, Map<String, dynamic>>>
      stepperMenuInformasiFinansialPari(String id) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/informasi-finansial/stepper/$id';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (!res.data['success']) {
        return Left(res.data['message']);
      }

      return Right(res.data['data']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>>
      fetchInformasiFinansialPeriodOnePari(String id) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/finansial/list/$id';

      final res = await _dio.get(
        url,
        options: options(),
      );

      return res.data['success'] != true
          ? Left(res.data['message'])
          : Right(res.data['data'][0] as Map<String, dynamic>);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>>
      fetchInformasiFinansialPeriodTwoPari(String id) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/finansial/list/$id';

      final res = await _dio.get(
        url,
        options: options(),
      );

      return res.data['success'] != true
          ? Left(res.data['message'])
          : Right(res.data['data'][1] as Map<String, dynamic>);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>>
      fetchInformasiFinansialPeriodThreePari(String id) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/finansial/list/$id';

      final res = await _dio.get(
        url,
        options: options(),
      );

      return res.data['success'] != true
          ? Left(res.data['message'])
          : Right(res.data['data'][2] as Map<String, dynamic>);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>>
      fetchInformasiFinansialPeriodFourPari(String id) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/finansial/list/$id';

      final res = await _dio.get(
        url,
        options: options(),
      );

      return res.data['success'] != true
          ? Left(res.data['message'])
          : Right(res.data['data'][3] as Map<String, dynamic>);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>>
      fetchInformasiFinansialPeriodFourProyeksi(
    String id,
    int codeTable,
  ) async {
    try {
      final String url;
      if (codeTable == Common.CodeTable.PT) {
        url = '${F.variables['maksimaURL']}/v1/pt/prakarsa/finansial/list/$id';
      } else if (codeTable == Common.CodeTable.CV) {
        url = '${F.variables['maksimaURL']}/v1/cv/prakarsa/finansial/list/$id';
      } else {
        url = '${F.variables['maksimaURL']}/v1/pr/prakarsa/finansial/list/$id';
      }

      final res = await _dio.get(
        url,
        options: options(),
      );

      return res.data['success'] != true
          ? Left(res.data['message'])
          : Right(res.data['data'][4] as Map<String, dynamic>);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> fetchDraftPTK({
    required String prakarsaId,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/draft-ptk/generate-pdf';

      final res = await _dio.post(
        url,
        data: {
          'prakarsaId': prakarsaId,
        },
        options: options(),
      );

      if (res.data['success'] == false) {
        return Left(res.data['message'] as String);
      }

      return Right(res.data['data']['url'] as String);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelRevisiAdkOrCbl>> fetchRevisiAdkOrCbl({
    required String ticket,
    required String checker,
    required String id,
  }) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/pr/prakarsa/revision/detail/$id?revisionTicket=$ticket&checker=$checker';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['data'] == null) {
        return Left(res.data['message'] as String);
      }

      return Right(RitelRevisiAdkOrCbl.fromJson(
        res.data['data'] as Map<String, dynamic>,
      ));
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, bool>> sendToChecker({
    required String prakarsaId,
    required String draftPTKPath,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/send-to-checker?prakarsaId=$prakarsaId&draftPTKPath=$draftPTKPath';

      final res = await _dio.post(
        url,
        options: options(),
      );

      return res.data['success'] != true
          ? Left(res.data['message'])
          : Right(res.data['success']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<RitelInformasiFinansialPari, RitelInformasiFinansialPari>>
      fetchInformasiFinansialPari(String id) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/finansial/list/$id';

      final res = await _dio.get(
        url,
        options: options(),
      );

      return res.data['success'] != true
          ? Left(RitelInformasiFinansialPari.fromJson(res.data))
          : Right(RitelInformasiFinansialPari.fromJson(res.data));
    } on DioError catch (e) {
      return Left(RitelInformasiFinansialPari.fromJson(e.response!.data));
    }
  }

  Future<Either<String, RitelMutasiTransaksiPariModel>>
      fetchMutasiTransaksiPari(String id) async {
    try {
      dev.log(id);
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/finansial/mutasi-transaksi/list/$id';

      final res = await _dio.get(
        url,
        options: options(),
      );

      return res.data['success'] != true
          ? const Left('Ke Error')
          : Right(RitelMutasiTransaksiPariModel.fromJson(res.data));
    } on DioError catch (e) {
      return Left(e.response!.data);
    }
  }
}
