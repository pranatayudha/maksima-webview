import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/models/ritel_informasi_agunan_tambahan.dart';
import '../../application/models/ritel_informasi_agunan_tambahan_detail_cash_coll.dart';
import '../../application/models/ritel_informasi_agunan_tambahan_detail_mesin.dart';
import '../../application/models/ritel_informasi_agunan_tambahan_detail_motor.dart';
import '../../application/models/ritel_informasi_agunan_tambahan_detail_tanah.dart';
import '../../application/models/ritel_informasi_agunan_tambahan_detail_tanah_bangunan.dart';
import '../../application/services/local_db_service.dart';

class RitelInformasiAgunanTambahanAPI {
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

  Future<Either<String, List<RitelInformasiAgunanTambahan>>>
      fetchAgunanTambahan({
    required String prakarsaId,
    required String prakarsaType,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/list/$prakarsaId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final ritelInformasiAgunanTambahan =
          List<RitelInformasiAgunanTambahan>.from(
        res.data['data'].map(
          (i) =>
              RitelInformasiAgunanTambahan.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(ritelInformasiAgunanTambahan);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiAgunanTambahanDetailTanah>>
      fetchDetailAgunanTambahanTanah({
    required String id,
    required String prakarsaId,
    required String codeTable,
    required String prakarsaType,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/detail?id=$id&prakarsaId=$prakarsaId&codeTable=$codeTable';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelInformasiAgunanTambahanDetailTanah.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiAgunanTambahanDetailTanahBangunan>>
      fetchDetailAgunanTambahanTanahBangunan({
    required String id,
    required String prakarsaId,
    required String codeTable,
    required String prakarsaType,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/detail?id=$id&prakarsaId=$prakarsaId&codeTable=$codeTable';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelInformasiAgunanTambahanDetailTanahBangunan.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiAgunanTambahanDetailMotor>>
      fetchDetailAgunanTambahanMotor({
    required String id,
    required String prakarsaId,
    required String codeTable,
    required String prakarsaType,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/detail?id=$id&prakarsaId=$prakarsaId&codeTable=$codeTable';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelInformasiAgunanTambahanDetailMotor.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiAgunanTambahanDetailCashCollateral>>
      fetchDetailAgunanTambahanCashCollateral({
    required String id,
    required String prakarsaId,
    required String codeTable,
    required String prakarsaType,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/detail?id=$id&prakarsaId=$prakarsaId&codeTable=$codeTable';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelInformasiAgunanTambahanDetailCashCollateral.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiAgunanTambahanDetailMesin>>
      fetchDetailAgunanTambahanMesin({
    required String id,
    required String prakarsaId,
    required String codeTable,
    required String prakarsaType,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/detail?id=$id&prakarsaId=$prakarsaId&codeTable=$codeTable';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelInformasiAgunanTambahanDetailMesin.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> addAgunanTambahanTanah(
    Map<String, dynamic> payload,
    String prakarsaType,
  ) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/tanah/add';

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

  Future<Either<String, String>> addAgunanTambahanCashCollateral(
    Map<String, dynamic> payload,
    String prakarsaType,
  ) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/cash-collateral/add';

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

  Future<Either<String, String>> addAgunanTambahanKendaraanBermotor(
    Map<String, dynamic> payload,
    String prakarsaType,
  ) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/kendaraan-bermotor/add';

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

  Future<Either<String, String>> addAgunanTambahanMesin(
    Map<String, dynamic> payload,
    String prakarsaType,
  ) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/mesin/add';

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

  Future<Either<String, String>> addAgunanTambahanTanahBangunan(
    Map<String, dynamic> payload,
    String prakarsaType,
  ) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/tanah-bangunan/add';

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

  Future<Either<String, String>> updateAgunanTambahanTanah(
    Map<String, dynamic> payload,
    String prakarsaType,
  ) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/tanah/update';

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

  Future<Either<String, String>> updateAgunanTambahanCashCollateral(
    Map<String, dynamic> payload,
    String prakarsaType,
  ) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/cash-collateral/update';

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

  Future<Either<String, String>> updateAgunanTambahanKendaraanBermotor(
    Map<String, dynamic> payload,
    String prakarsaType,
  ) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/kendaraan-bermotor/update';

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

  Future<Either<String, String>> updateAgunanTambahanMesin(
    Map<String, dynamic> payload,
    String prakarsaType,
  ) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/mesin/update';

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

  Future<Either<String, String>> updateAgunanTambahanTanahBangunan(
    Map<String, dynamic> payload,
    String prakarsaType,
  ) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/tanah-bangunan/update';

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

  Future<Either<String, String>> deleteAgunanTambahan({
    required String id,
    required String prakarsaId,
    required String codeTable,
    required String prakarsaType,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/$prakarsaType/prakarsa/agunan-tambahan/delete?id=$id&prakarsaId=$prakarsaId&codeTable=$codeTable';

      final res = await _dio.delete(
        url,
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

  Future<Either<String, List<RitelInformasiAgunanTambahan>>>
      fetchAgunanTambahanPari({
    required String prakarsaId,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/agunan-tambahan/list/$prakarsaId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      final ritelInformasiAgunanTambahan =
          List<RitelInformasiAgunanTambahan>.from(
        res.data['data'].map(
          (i) =>
              RitelInformasiAgunanTambahan.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return Right(ritelInformasiAgunanTambahan);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiAgunanTambahanDetailTanah>>
      fetchDetailAgunanTambahanTanahPari({
    required String id,
    required String prakarsaId,
    required String codeTable,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/agunan-tambahan/detail?id=$id&prakarsaId=$prakarsaId&codeTable=$codeTable';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelInformasiAgunanTambahanDetailTanah.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiAgunanTambahanDetailTanahBangunan>>
      fetchDetailAgunanTambahanTanahBangunanPari({
    required String id,
    required String prakarsaId,
    required String codeTable,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/agunan-tambahan/detail?id=$id&prakarsaId=$prakarsaId&codeTable=$codeTable';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelInformasiAgunanTambahanDetailTanahBangunan.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiAgunanTambahanDetailMotor>>
      fetchDetailAgunanTambahanMotorPari({
    required String id,
    required String prakarsaId,
    required String codeTable,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/agunan-tambahan/detail?id=$id&prakarsaId=$prakarsaId&codeTable=$codeTable';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelInformasiAgunanTambahanDetailMotor.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiAgunanTambahanDetailCashCollateral>>
      fetchDetailAgunanTambahanCashCollateralPari({
    required String id,
    required String prakarsaId,
    required String codeTable,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/agunan-tambahan/detail?id=$id&prakarsaId=$prakarsaId&codeTable=$codeTable';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelInformasiAgunanTambahanDetailCashCollateral.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, RitelInformasiAgunanTambahanDetailMesin>>
      fetchDetailAgunanTambahanMesinPari({
    required String id,
    required String prakarsaId,
    required String codeTable,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/agunan-tambahan/detail?id=$id&prakarsaId=$prakarsaId&codeTable=$codeTable';

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true) {
        return Left(res.data['message'] as String);
      }

      return Right(
        RitelInformasiAgunanTambahanDetailMesin.fromJson(
          res.data['data'] as Map<String, dynamic>,
        ),
      );
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> addAgunanTambahanTanahPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/agunan-tambahan/tanah/add';

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

  Future<Either<String, String>> addAgunanTambahanCashCollateralPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/agunan-tambahan/cash-collateral/add';

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

  Future<Either<String, String>> addAgunanTambahanKendaraanBermotorPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/agunan-tambahan/kendaraan-bermotor/add';

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

  Future<Either<String, String>> addAgunanTambahanMesinPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/agunan-tambahan/mesin/add';

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

  Future<Either<String, String>> addAgunanTambahanTanahBangunanPari(
    Map<String, dynamic> payload,
  ) async {
    try {
      String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/agunan-tambahan/tanah-bangunan/add';

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

  Future<Either<String, String>> deleteAgunanTambahanPari({
    required String id,
    required String prakarsaId,
    required String codeTable,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pari/prakarsa/agunan-tambahan/delete?id=$id&prakarsaId=$prakarsaId&codeTable=$codeTable';

      final res = await _dio.delete(
        url,
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
