import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class FriendRequestsPage extends GetView<FriendRequestsController> {
  const FriendRequestsPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("FriendRequestsPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FriendRequestsController>(
      init: FriendRequestsController(),
      id: "friend_requests",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("friend_requests")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
