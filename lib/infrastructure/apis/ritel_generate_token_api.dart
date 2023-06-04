import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../flavors.dart';
import '../../application/app/app.locator.dart';
import '../../application/helpers/dio_error_type_parser.dart';
import '../../application/models/user.dart';
import '../../application/services/local_db_service.dart';

class RitelGenerateTokenAPI {
  final _dio = Dio();
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();

  var options = Options(
    contentType: 'application/json',
    followRedirects: false,
    validateStatus: (status) => true,
    headers: {
      'Authorization': F.variables['maksimaBasicAuth'],
    },
  );

  Future<Either<String, bool>> generateToken({
    required User user,
  }) async {
    try {
      final String login = '${F.variables['maksimaURL']}/v1/pr/generate-token';

      final payload = {
        'data': {
          'userId': user.userId,
          'userName': user.userName,
          'branchCode': user.branchCode == '9999' ? '0020' : user.branchCode,
          'orgId': user.orgId,
          'organization': user.organization,
          'job': user.jabatan,
          'loginTicket': user.loginTicket,
          'accessLevel': '10',
          'photo': user.foto.toString(),
        },
      };

      final res = await _dio.post(
        login,
        data: payload,
        options: options,
      );

      final accessToken = res.data['data']['accessToken'] as String;

      _localDBService.ritelStoreToken(accessToken);

      return const Right(true);
    } on DioError catch (e) {
      final errorMessage = DioErrorTypeParser.parseToCustomMessage(e);

      return Left(errorMessage);
    }
  }
}
