import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChattingController extends GetxController {
  ChattingController();

  final ScrollController scrollController = ScrollController();
  final FocusNode richInputExpandedFocusNode = FocusNode();
  final FocusNode richInputCollapsedFocusNode = FocusNode();

  _initData() {
    update(["chatting"]);
  }

  void onLoading() async {
    update(["message_list"]);
  }

  void onRefresh() async {
    update(["message_list"]);
  }

  void onTap() {
    // 优化发送消息后滚动位置
    // Move the scroll position to the bottom
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    richInputCollapsedFocusNode.dispose();
    richInputExpandedFocusNode.dispose();
    scrollController.dispose();
  }
}
