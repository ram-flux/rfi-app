import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ContactDetailPage extends GetView<ContactDetailController> {
  const ContactDetailPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("DetailPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactDetailController>(
      init: ContactDetailController(),
      id: "detail",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("detail")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
