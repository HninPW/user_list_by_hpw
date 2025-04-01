import 'package:hive/hive.dart';
import 'package:user_list_by_hnin_pwint_wai/data/vos/user/user_vo.dart';

abstract class UserDao {

  void save(List<UserVo> recipesVo);

  List<UserVo>? getUserListFromDataBase();

  Stream watchUserBox();

  Stream<List<UserVo>?> getUserListFromDataBaseStream();

  Box<UserVo> getUserBox();

}
