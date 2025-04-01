import 'package:dio/dio.dart';
import 'package:user_list_by_hnin_pwint_wai/data/vos/user/user_vo.dart';
import 'package:user_list_by_hnin_pwint_wai/network/data_agent/user_data_agent.dart';
import '../../config/config.dart';
import '../api/dio_client.dart';
import '../api/user_api.dart';

class UserDataAgentImpl extends UserDataAgent{
  late UserApi _userApi;

  UserDataAgentImpl._(){
    _userApi = UserApi(DioClient.createDio(), baseUrl: Config.baseUrl);
  }

  static final UserDataAgentImpl _singleton = UserDataAgentImpl._();

  factory UserDataAgentImpl(){
    return _singleton;
  }

  @override
  Future<List<UserVo>?> getUsers() {
    return _userApi
        .getUsersResponse()
        .asStream()
        .map((event) => event)
        .first;
  }
}