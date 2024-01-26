import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ChattingPage extends GetView<ChattingController> {
  const ChattingPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("ChattingPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChattingController>(
      init: ChattingController(),
      id: "chatting",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("chatting")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
