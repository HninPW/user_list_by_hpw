import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:user_list_by_hnin_pwint_wai/data/vos/user/user_vo.dart';
import '../../data/model/user_model.dart';
import '../../data/model/user_model_impl.dart';
import '../../widgets/custom_toast.dart';

class UserController extends GetxController {
  var users = <UserVo>[].obs;
  var isLoading = true.obs;
  var isConnected = true.obs;
  final UserModel _userModel = UserModelImpl();
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    await checkConnectivity();
    await fetchUsers();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }


  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    // Check if device is connected to WiFi or mobile data
    if (connectivityResult != ConnectivityResult.none) {
      // Perform an actual internet check
      bool hasInternet = await _hasInternetAccess();

      if (hasInternet) {
        print('Internet connection available');
        isConnected.value = true;
      } else {
        print('No actual internet connection');
        isConnected.value = false;
        _showNoInternetToast();
      }
    } else {
      print('No network connection');
      isConnected.value = false;
      _showNoInternetToast();
    }
  }

  Future<bool> _hasInternetAccess() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  void _showNoInternetToast() {
    CustomToast.showToast(
      msg: "No internet connection!",
      fontSize: 16.0,
    );
  }


  Future<void> fetchUsers() async {
    try {
        if (isConnected.value) {
          print("Fetching new users from API...");
          await _userModel.getUsers();
        }

      // Always update UI from database
      _userModel.getUserListFromDataBaseStream().listen((event) {
        if (event != null && event.isNotEmpty) {
          users.value = event;
          print("User List From Database: ${users.value}");
        } else {
          print("No user found in the database.");
        }
      });

    } finally {
      isLoading(false);
    }
  }

}
