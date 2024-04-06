import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:ramflux_app/shared/index.dart';

import 'index.dart';

class InviteFriendsPage extends GetView<InviteFriendsController> {
  const InviteFriendsPage({super.key});

  // 已选择的用户
  Widget _buildSelectedUser() {
    return <Widget>[
      <Widget>[
        const AvatarWidget(
          'https://picsum.photos/50',
          radius: 32,
        ),
        Positioned(
          top: -2,
          right: -2,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.background,
                shape: BoxShape.circle,
              ),
              child: IconWidget.icon(
                Icons.close_outlined,
                color: AppColors.onBackground,
                size: 22,
              ),
            ),
          ),
        ),
      ].toStack(),
      const SizedBox(height: 4),
      TextWidget(
        text: 'User Name',
        size: 12,
        color: AppColors.onBackground,
        weight: FontWeight.bold,
      ),
    ].toColumn();
  }

  // 已选择用户列表视图
  Widget _buildSelectedView() {
    return SizedBox(
      height: 104,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        padding: const EdgeInsets.all(8),
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (_, index) {
          return _buildSelectedUser().paddingHorizontal(8);
        },
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return NestedScrollView(
      floatHeaderSlivers: false,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          const SliverToBoxAdapter(
            child: SearchBarWidget(),
          ),
          SliverToBoxAdapter(
            child: _buildSelectedView(),
          ),
          SliverPersistentHeader(
            delegate: _HeaderDelegate(
              height: 32,
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.tertiary,
                ),
                child: TextWidget(
                  text: 'Placeholder Text',
                  size: 14,
                  color: AppColors.onSurface,
                ).padding(
                  horizontal: 16,
                  vertical: 6,
                ),
              ),
            ),
            pinned: true,
          )
        ];
      },
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanDown: (_) => FocusScope.of(Get.context!).unfocus(),
        child: GroupedListView(
          elements: controller.users,
          groupBy: (user) => user['group'],
          groupComparator: (value1, value2) => value1.compareTo(value2),
          itemComparator: (item1, item2) =>
              item1['name'].compareTo(item2['name']),
          useStickyGroupSeparators: true,
          groupSeparatorBuilder: (String value) => Container(
            color: AppColors.tertiary,
            child: TextWidget(
              text: value,
              size: 14,
              color: AppColors.onSurface,
            ).padding(
              horizontal: 16,
              vertical: 6,
            ),
          ),
          separator: const Divider(height: 1),
          itemBuilder: (context, user) {
            return UserListTile(
              trailing: ButtonWidget.icon(
                Icon(
                  Icons.check_circle_outline,
                  color: AppColors.primary,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InviteFriendsController>(
      init: InviteFriendsController(),
      id: "invite_friends",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(
            titleString: LocaleKeys.commodityInviteFriendsAppBarTitle.tr,
            actions: [
              ButtonWidget.icon(
                IconWidget.icon(
                  Icons.east_rounded,
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

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  const _HeaderDelegate({
    required this.child,
    required this.height,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.background,
      child: child,
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(_HeaderDelegate oldDelegate) => true;
}
