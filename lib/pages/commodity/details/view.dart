import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/app.dart';
import 'package:ramflux_app/shared/index.dart';

import 'index.dart';

class CommodityDetailsPage extends GetView<DetailsController> {
  const CommodityDetailsPage({super.key});

  Widget _buildMemberAction(Function() onTap, IconData icon) {
    return <Widget>[
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.secondary,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconWidget.icon(
          icon,
          size: 44,
          color: AppColors.secondary,
        ).inkWell(
          onTap: onTap,
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ].toColumn();
  }

  Widget _buildMembers() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 20,
        childAspectRatio: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        if (index == 8 - 2) {
          return _buildMemberAction(() {}, Icons.add);
        }
        if (index == 8 - 1) {
          return _buildMemberAction(() {}, Icons.remove);
        }
        return <Widget>[
          AvatarWidget(
            'https://picsum.photos/200?random=$index',
            radius: 24,
          ),
          const TextWidget(
            text: 'lwelllsfdsfsfs',
            overflow: TextOverflow.ellipsis,
          ).paddingHorizontal(10),
        ].toColumn();
      },
    ).paddingAll(10);
  }

  Widget _buildOptionListTile(String title, Widget trailing, Function() onTap) {
    return ListTileWidget(
      padding: const EdgeInsets.fromLTRB(20, 15, 10, 15),
      title: TextWidget(
        text: title,
        style: TextStyle(
          color: AppColors.onBackground,
          fontSize: 16,
        ),
      ),
      trailing: [
        trailing,
      ],
      separatorColor: AppColors.tertiary,
      onTap: onTap,
    );
  }

  Widget _buildInkWellButton(String title, Function() onTap) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      child: TextWidget(
        text: title,
        style: TextStyle(
          color: AppColors.error,
          fontSize: 16,
        ),
      ),
    ).inkWell(
      onTap: onTap,
    );
  }

  Widget _buildOptionListTiles() {
    return <Widget>[
      _buildOptionListTile(
        LocaleKeys.commodityDetailsCommodityName.tr,
        <Widget>[
          TextWidget(
            text: 'Sudfn Uwsuu',
            style: TextStyle(
              color: AppColors.secondary,
              fontSize: 16,
            ),
          ),
          IconWidget.icon(
            Icons.chevron_right,
          ),
        ].toRow(),
        () => null,
      ),
      _buildOptionListTile(
        LocaleKeys.commodityDetailsCommodityAccount.tr,
        TextWidget(
          text: ' 100000',
          style: TextStyle(
            color: AppColors.secondary,
            fontSize: 16,
          ),
        ).paddingOnly(right: 8),
        () => null,
      ),
      const DividerWidget(
        size: 5,
      ),
      _buildOptionListTile(
        LocaleKeys.commodityDetailsViewChatContent.tr,
        IconWidget.icon(
          Icons.chevron_right,
        ),
        () => null,
      ),
      const DividerWidget(
        size: 5,
      ),
      _buildOptionListTile(
        LocaleKeys.commodityDetailsMessageMute.tr,
        Switch(
          value: true,
          onChanged: (bool value) {},
        ).height(24),
        () => null,
      ),
      _buildOptionListTile(
        LocaleKeys.commodityDetailsPinCommodity.tr,
        Switch(
          value: false,
          onChanged: (bool value) {},
        ).height(24),
        () => null,
      ),
      _buildOptionListTile(
        LocaleKeys.commodityDetailsSaveToContacts.tr,
        Switch(
          value: false,
          onChanged: (bool value) {},
        ).height(24),
        () => null,
      ),
      const DividerWidget(
        size: 5,
      ),
      _buildOptionListTile(
        LocaleKeys.commodityDetailsCreateGroup.tr,
        IconWidget.icon(
          Icons.chevron_right,
        ),
        () => Get.toNamed(RouteNames.commodityNewGroup),
      ),
      const DividerWidget(
        size: 20,
      ),
      _buildInkWellButton(
        LocaleKeys.commodityDetailsExitCommodity.tr,
        () {},
      ),
      const DividerWidget(
        size: 10,
      ),
      _buildInkWellButton(
        LocaleKeys.commodityDetailsDismissCommodity.tr,
        () => null,
      ),
      const DividerWidget(
        size: 20,
      ),
    ].toColumn();
  }

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: <Widget>[
        _buildMembers(),
        const DividerWidget(
          size: 6,
        ),
        _buildOptionListTiles(),
      ].toColumn(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      init: DetailsController(),
      id: "details",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(
            titleString: LocaleKeys.commodityDetailsAppBarTitle.trParams(
              {'count': '10'},
            ),
          ),
          body: SafeArea(
            child: _buildView(),
          ),
          backgroundColor: AppColors.primaryContainer,
        );
      },
    );
  }
}
