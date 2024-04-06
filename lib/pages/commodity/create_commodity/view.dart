import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

import 'index.dart';

class CreateCommodityPage extends GetView<CreateCommodityController> {
  const CreateCommodityPage({super.key});

  // 主视图
  Widget _buildView() {
    // 头部固定的视图, 底部可滚动的视图
    return <Widget>[
      <Widget>[
        TextWidget(
          text: LocaleKeys.commodityCreateCommodityNameFieldLabel.tr,
          size: 14,
          color: AppColors.onBackground,
        ),
        const SizedBox(width: 10),
        InputWidget.text(
          hintText: LocaleKeys.commodityCreateCommodityNameFieldHint.tr,
          fontSize: 14,
          controller: TextEditingController(),
          onChanged: (value) {},
        ).expanded(),
      ]
          .toRow()
          .padding(vertical: 15, horizontal: 20)
          .backgroundColor(AppColors.primaryContainer),
      ListView.separated(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return UserListTile(
            avatarRadius: 26,
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            trailing: ButtonWidget.icon(
              Icon(
                Icons.close_rounded,
                color: AppColors.onBackground,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 1,
        ),
      ).expanded(),
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCommodityController>(
      init: CreateCommodityController(),
      id: "create_commodity",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(
            titleString: LocaleKeys.commodityCreateCommodityAppBarTitle.tr,
            actions: [
              ButtonWidget.icon(
                IconWidget.icon(
                  Icons.check_rounded,
                  color: AppColors.primary,
                ),
                onTap: controller.next,
              )
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
