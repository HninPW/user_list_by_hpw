import 'package:hive/hive.dart';
import 'package:user_list_by_hnin_pwint_wai/data/vos/user/user_vo.dart';
import '../../constant/hive_constant.dart';
import 'user_dao.dart';

class UserDaoImpl extends UserDao {
  UserDaoImpl._();

  static final UserDaoImpl _singleton = UserDaoImpl._();

  factory UserDaoImpl() => _singleton;

  @override
  UserVo? getUserByID(String id) => _getUserBox().get(id);

  @override
  List<UserVo>? getUserListFromDataBase() =>  _getUserBox().values.toList();

  @override
  void save(List<UserVo> usersList) {
    for (UserVo userVo in usersList) {
      _getUserBox().put(userVo.id, userVo);
    }
  }

  Box<UserVo> _getUserBox() => Hive.box<UserVo>(kBoxNameForUserVO);

  @override
  Box<UserVo> getUserBox() {
    return Hive.box<UserVo>(kBoxNameForUserVO);
  }

  @override
  Stream watchUserBox() => _getUserBox().watch();

  @override
  Stream<List<UserVo>?> getUserListFromDataBaseStream() =>
      Stream.value(getUserListFromDataBase());
}
