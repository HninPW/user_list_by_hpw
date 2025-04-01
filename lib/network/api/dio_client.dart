import 'package:dio/dio.dart';
import 'package:user_list_by_hnin_pwint_wai/config/config.dart';

class DioClient {
  static Dio createDio() {
    final dio = Dio(BaseOptions(baseUrl: Config.baseUrl));
    return dio;
  }
}
