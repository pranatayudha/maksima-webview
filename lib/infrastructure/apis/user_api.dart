import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../application/app/app.locator.dart';
import '../../application/app/constants/endpoint.dart';
import '../../application/helpers/dio_error_type_parser.dart';
import '../../application/models/user.dart';
import '../../application/services/local_db_service.dart';
import 'employees_api.dart';

class UserAPI {
  final _dio = locator<Dio>();
  final _localDBService = locator<MaksimaLocalDBService>();
  final _employeesAPI = locator<EmployeesAPI>();

  Future<Either<String, User>> loginSSO({
    required String? userId,
    required String? password,
    required String? ipAddress,
  }) async {
    try {
      final res = await _dio.post(
        Endpoint.userLoginSSO,
        data: {
          'userId': userId,
          'password': base64Url.encode(utf8.encode(password!)),
          'ipAddress': ipAddress,
        },
      );

      if (res.data['status'] != 200) {
        return Left(res.data['message'] as String);
      }

      final user = User.fromJson(res.data['data'] as Map<String, dynamic>);

      _localDBService.storeUser(user);
      _localDBService.storeToken(user.accessToken!);
      _employeesAPI.registerEmployee();

      return Right(user);
    } on DioError catch (e) {
      final errorMessage = DioErrorTypeParser.parseToCustomMessage(e);

      return Left(errorMessage);
    }
  }

  Future<Either<String, bool>> logoutSSO({
    required String? userId,
    required String? loginTicket,
  }) async {
    try {
      final res = await _dio.post(
        Endpoint.userLogoutSSO,
        data: {
          'userId': userId,
          'loginTicket': loginTicket,
        },
      );

      if (res.data['status'] != 200) {
        return Left(res.data['message'] as String);
      }

      return const Right(true);
    } on DioError catch (e) {
      final errorMessage = DioErrorTypeParser.parseToCustomMessage(e);

      return Left(errorMessage);
    }
  }
}
