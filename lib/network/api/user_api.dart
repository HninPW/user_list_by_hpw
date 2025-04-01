import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:user_list_by_hnin_pwint_wai/data/vos/user/user_vo.dart';
import '../../config/config.dart';
import '../../constant/api_constant.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi{

  factory UserApi(Dio dio, {required String baseUrl}) => _UserApi(dio, baseUrl: baseUrl);

  /// get Users
  @GET(kUsers)
  Future<List<UserVo>?> getUsersResponse();

}