import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ramflux_app/shared/index.dart';

import 'index.dart';

class ConversationsPage extends GetView<ConversationsController> {
  const ConversationsPage({super.key});

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
    return SmartRefresher(
      controller: controller.refreshController,
      enablePullDown: true,
      enablePullUp: false,
      onRefresh: controller.onRefresh,
      child: ListView.separated(
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
            indent: 70,
          );
        },
      ),
    ).expanded();
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[
      const SearchBarWidget(),
      _buildListView(),
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
              PopupMenuButtonWidget(
                onSelected: (value) {
                  debugPrint(value);
                },
                icon: IconWidget.icon(
                  Icons.add,
                  color: AppColors.onTertiaryContainer,
                ),
                items: [
                  PopupMenuButtonItem(
                    text: LocaleKeys.chatsConversationsAddFriend.tr,
                    imageUrl: AssetsIcons.addPersonSvg,
                    value: 'add_friend',
                  ),
                  PopupMenuButtonItem(
                    text: LocaleKeys.chatsConversationsNewCommunity.tr,
                    imageUrl: AssetsIcons.newCommunitySvg,
                    value: 'new_community',
                  ),
                  PopupMenuButtonItem(
                    text: LocaleKeys.chatsConversationsJoinCommunity.tr,
                    imageUrl: AssetsIcons.joinCommunitySvg,
                    value: 'join_community',
                  ),
                ],
              ),
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
