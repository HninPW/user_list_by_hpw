import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_list_by_hnin_pwint_wai/constant/dimens.dart';
import 'package:user_list_by_hnin_pwint_wai/item_views/user_detail_item_view.dart';
import '../controller/user_controller/user_controller.dart';

class UserListItemView extends StatelessWidget {
  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async => controller.fetchUsers(),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return controller.users.isEmpty
              ? const Center(child: Text('No Users Available'))
              : ListView.separated(
            padding: const EdgeInsets.all(kSP12x),
            itemCount: controller.users.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final user = controller.users[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kSP12x),
                ),
                elevation: 3,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: kSP8x, horizontal: kSP16x),
                  title: Text(user.name ?? 'User Name', style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(user.email ?? 'example@mail.com'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: kSP18x, color: Colors.grey),
                  onTap: () => Get.to(() => UserDetailItemView(user: user)),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}