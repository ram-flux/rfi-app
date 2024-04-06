import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class NewGroupPage extends GetView<NewGroupController> {
  const NewGroupPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("NewGroupPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewGroupController>(
      init: NewGroupController(),
      id: "new_group",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("new_group")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
