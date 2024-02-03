import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ramflux_app/shared/index.dart';

import 'index.dart';

class ContactListPage extends GetView<ContactListController> {
  const ContactListPage({super.key});

  // Empty placeholder
  Widget _buildEmptyPlaceholder() {
    return <Widget>[
      TextWidget.titleMedium(
        LocaleKeys.contactsListEmptyPlaceholder.tr,
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
        return ContactSlidableWidget(
          onDeletePressed: controller.onDeletePressed,
          child: ContactListTile(
            onTap: () {
              Get.toNamed(RouteNames.contactsDetail);
            },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 1,
          indent: 60,
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
    return GetBuilder<ContactListController>(
      init: ContactListController(),
      id: "contacts_list",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(
            titleString: LocaleKeys.contactsListAppBarTitle.tr,
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
