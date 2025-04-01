import 'package:flutter/material.dart';
import 'package:user_list_by_hnin_pwint_wai/constant/dimens.dart';
import 'package:user_list_by_hnin_pwint_wai/data/vos/user/user_vo.dart';

class UserDetailItemView extends StatelessWidget {
  final UserVo user;
  const UserDetailItemView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name ?? 'User Name'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kSP16x),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kSP12x),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(kSP16x),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDetailRow("Name", user.name),
                _buildDetailRow("Username", user.username),
                _buildDetailRow("Email", user.email),
                _buildDetailRow("Address", "${user.address?.street ?? 'Unknown'}, ${user.address?.city ?? 'Unknown'}"),
                _buildDetailRow("Phone", user.phone),
                _buildDetailRow("Website", user.website),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSP6x),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title:",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: kSP16x),
          ),
          const SizedBox(width: kSP8x),
          Expanded(
            child: Text(
              value ?? "N/A",
              style: const TextStyle(fontSize: kSP16x),
            ),
          ),
        ],
      ),
    );
  }
}