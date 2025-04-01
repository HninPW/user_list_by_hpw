import 'package:flutter/material.dart';
import 'package:user_list_by_hnin_pwint_wai/item_views/user_list_item_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserListItemView(),
    );
  }
}
