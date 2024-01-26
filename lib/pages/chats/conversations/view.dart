import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ramflux_app/shared/index.dart';

import 'index.dart';

class ConversationsPage extends GetView<ConversationsController> {
  const ConversationsPage({Key? key}) : super(key: key);

  // Empty placeholder
  Widget _buildEmptyPlaceholder() {
    return <Widget>[
      IconWidget.svg(
        AssetsIcons.chatEmptySvg,
        width: 136,
        height: 136,
      ).marginOnly(bottom: 40),
      TextWidget.titleMedium(
        LocaleKeys.chatsConversationsEmptyPlaceholder.tr,
        color: AppColors.onSecondary,
      ),
    ].toColumn(mainAxisAlignment: MainAxisAlignment.center);
  }

  // List view
  Widget _buildListView() {
    // return _buildEmptyPlaceholder();
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ConversationSlidableWidget(
          onNotShownPressed: controller.onNotShownPressed,
          onMutePressed: controller.onMutePressed,
          onDeletePressed: controller.onDeletePressed,
          onArchivePressed: controller.onArchivePressed,
          onAddMenuPressed: controller.onAddMenuPressed,
          onPinPressed: controller.onPinPressed,
          child: ConversationListTile(
            onTap: () {
              Get.toNamed(RouteNames.chatsChatting);
            },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 1,
          indent: 80,
        );
      },
    );
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[
      const SearchBarWidget(),
      SmartRefresher(
        controller: controller.refreshController,
        enablePullDown: true,
        enablePullUp: false,
        onRefresh: controller.onRefresh,
        child: _buildListView(),
      ).expanded(),
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConversationsController>(
      init: ConversationsController(),
      id: "conversations",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(
            titleString: 'RamFlux',
            actions: [
              ButtonWidget.icon(IconWidget.icon(
                Icons.add,
                color: AppColors.onTertiaryContainer,
              ))
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
