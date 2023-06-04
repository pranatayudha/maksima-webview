import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/models/monitoring_detail.dart';
import '../../application/models/monitoring_list_item_ritel.dart';
import '../../application/models/monitoring_pinjaman_detail.dart';
import '../../application/services/local_db_service.dart';

class RitelMonitoringAPI {
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

  // ignore: long-parameter-list
  Future<List<MonitoringListItemRitel>?> fetchMonitoring({
    required int page,
    required int limit,
    int? loanType,
    String? textSearch,
    String? status,
  }) async {
    try {
      final String url = '${F.variables['maksimaURL']}/v1/pr/monitoring/list';

      final params = {
        'page': page,
        'limit': limit,
        'loanType': loanType,
        'name': textSearch,
        'status': status,
      };

      if (kDebugMode) {
        print('Monitoring Endpoint : $url');
        print('Monitoring Params : $params');
      }

      final res = await _dio.get(
        url,
        queryParameters: params,
        options: options(),
      );

      if (kDebugMode) {
        print('Monitoring Res : ${res.data}');
      }

      if (!res.data['success'] ||
          (res.statusCode! < 200 || res.statusCode! > 299)) {
        throw res.data['message'] as String;
        // return null;
      }

      final ritelMonitoring = List<MonitoringListItemRitel>.from(
        res.data['data'].map(
          (i) => MonitoringListItemRitel.fromJson(i as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      return ritelMonitoring;
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      rethrow;
    }
  }

  Future<MonitoringDetail?> fetchMonitoringDetail({
    required String idKelolaan,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/monitoring/debitur/detail/$idKelolaan';

      if (kDebugMode) {
        print('Monitoring Detail Endpoint : $url');
        print('Monitoring Detail Params : $idKelolaan');
      }

      final res = await _dio.get(
        url,
        options: options(),
      );

      if (res.data['success'] != true ||
          (res.statusCode! < 200 && res.statusCode! > 299)) {
        throw res.data['message'] as String;
      }

      if (kDebugMode) {
        print('Monitoring Detail Raw Data : ${res.data['data'][0]}');
      }

      final ritelMonitoring = MonitoringDetail.fromJson(res.data['data'][0]);

      /*final res = await Future.delayed(const Duration(seconds: 1), () {
        return monitoringDetailDummyResponse;
      });

      if (kDebugMode) {
        print('Monitoring Detail Res : $res');
      }

      final ritelMonitoring = MonitoringDetail.fromJson(res);

      if (kDebugMode) {
        print('Ritel Monitoring Detail Model : $ritelMonitoring');
      }*/

      return ritelMonitoring;
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Either<String, MonitoringPinjamanDetail?>> fetchPinjamanDetail({
    required int idKelolaan,
  }) async {
    try {
      final String url =
          '${F.variables['maksimaURL']}/v1/pr/monitoring/debitur/pencairan/detail';

      if (kDebugMode) {
        print('Pinjaman Detail Endpoint : $url');
        print('Pinjaman Detail Params : $idKelolaan');
      }

      final res = await _dio.get(
        url,
        options: options(),
        queryParameters: {
          'disburseId': idKelolaan,
        },
      );

      if (res.data['success'] != true ||
          (res.statusCode! < 200 && res.statusCode! > 299)) {
        return Left(res.data['message'] as String);
      }

      if (kDebugMode) {
        print('Pinjaman Detail Data : ${res.data['data']}');
      }

      final pinjamanDetail =
          MonitoringPinjamanDetail.fromJson(res.data['data']);

      if (kDebugMode) {
        print('Pinjaman Detail Model : $pinjamanDetail');
      }

      /*final res = await Future.delayed(const Duration(seconds: 1), () {
        return monitoringDetailDummyResponse;
      });

      if (kDebugMode) {
        print('Monitoring Detail Res : $res');
      }

      final ritelMonitoring = MonitoringDetail.fromJson(res);

      if (kDebugMode) {
        print('Ritel Monitoring Detail Model : $ritelMonitoring');
      }*/

      return Right(pinjamanDetail);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }
}
