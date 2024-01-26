import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class FriendProfilePage extends GetView<FriendProfileController> {
  const FriendProfilePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("FriendProfilePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FriendProfileController>(
      init: FriendProfileController(),
      id: "friend_profile",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("friend_profile")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
