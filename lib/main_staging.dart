import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:user_list_by_hnin_pwint_wai/data/vos/user/user_vo.dart';
import 'package:user_list_by_hnin_pwint_wai/pages/home_page.dart';
import 'config/config.dart';
import 'constant/hive_constant.dart';
import 'constant/strings.dart';
import 'data/vos/address/address_vo.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserVoAdapter());
  Hive.registerAdapter(AddressVoAdapter());

  await Hive.openBox<UserVo>(kBoxNameForUserVO);

  Config.environment = Environment.staging;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}