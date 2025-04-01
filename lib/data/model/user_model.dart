import 'package:user_list_by_hnin_pwint_wai/data/vos/user/user_vo.dart';

abstract class UserModel{

  Future<List<UserVo>?> getUsers();

  Stream<List<UserVo>?> getUserListFromDataBaseStream();

}