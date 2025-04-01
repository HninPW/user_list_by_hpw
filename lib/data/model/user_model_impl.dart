import 'package:stream_transform/stream_transform.dart';
import 'package:user_list_by_hnin_pwint_wai/data/model/user_model.dart';
import 'package:user_list_by_hnin_pwint_wai/data/vos/user/user_vo.dart';
import '../../network/data_agent/user_data_agent.dart';
import '../../network/data_agent/user_data_agent_impl.dart';
import '../../persistent/user_dao/user_dao.dart';
import '../../persistent/user_dao/user_dao_impl.dart';

class UserModelImpl extends UserModel {

  UserModelImpl._();

  static final UserModelImpl _singleton = UserModelImpl._();

  factory UserModelImpl(){
    return _singleton;
  }

  final UserDataAgent _dataAgent = UserDataAgentImpl();
  final UserDao _userDao = UserDaoImpl();



/// Users
  @override
  Future<List<UserVo>?> getUsers() {
    return _dataAgent.getUsers().then((value) {
      var temp = value;
      temp = temp?.map((e) {
        return e;
      }).toList();
      _userDao.save(temp ?? []);
      return temp;
    });
  }

  @override
  Stream<List<UserVo>?> getUserListFromDataBaseStream() => _userDao
      .watchUserBox()
      .startWith(_userDao.getUserListFromDataBaseStream())
      .map((event) => _userDao.getUserListFromDataBase());


}