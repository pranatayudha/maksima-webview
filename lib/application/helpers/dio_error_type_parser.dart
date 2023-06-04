import 'package:dio/dio.dart';

import '../app/constants/common.dart';

class DioErrorTypeParser {
  static String parseToCustomMessage(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
        return Common.dioErrorTypeConnectionTimeoutMessage;

      case DioErrorType.other:
        return Common.dioErrorTypeOtherMessage;

      default:
        return e.message;
    }
  }
}
