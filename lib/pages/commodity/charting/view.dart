import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

import 'index.dart';

class CommodityChartingPage extends GetView<ChartingController> {
  const CommodityChartingPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("Awfully quiet in here..."),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChartingController>(
      init: ChartingController(),
      id: "charting",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(
            titleString: 'Nuevo Producto',
            actions: <Widget>[
              const AvatarWidget(
                'https://picsum.photos/200',
                radius: 18,
              ).inkWell(
                onTap: () {
                  controller.toDetails();
                },
              ).marginOnly(right: 10),
            ],
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
