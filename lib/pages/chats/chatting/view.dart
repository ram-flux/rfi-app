import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

import 'index.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({super.key});

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _ChattingGetView();
  }
}

class _ChattingGetView extends GetView<ChattingController> {
  const _ChattingGetView();

  // override tag
  @override
  String? get tag => "chatting";

  final FeatureActiveConfig featureActiveConfig = const FeatureActiveConfig();
  final ChatViewConfiguration chatViewConfig = const ChatViewConfiguration();

  Widget _buildMessageList() {
    return GetBuilder<ChattingController>(
      id: "message_list",
      tag: tag,
      builder: (_) {
        return const ChatMessageListWidget();
      },
    );
  }

  Widget _buildMessageView() {
    return Expanded(
      child: Column(
        children: [
          // LoadingState
          // EmptyState
          // ErrorState
          // MessageList
          _buildMessageList(),
        ],
      ).onTap(() {
        controller.richInputCollapsedFocusNode.unfocus();
      }),
    );
  }

  // 主视图
  Widget _buildView() {
    return ChatViewInheritedWidget(
      featureActiveConfig: featureActiveConfig,
      richInputExpandedFocusNode: controller.richInputExpandedFocusNode,
      richInputCollapsedFocusNode: controller.richInputCollapsedFocusNode,
      child: Container(
        height: chatViewConfig.height ?? Get.height,
        width: chatViewConfig.width ?? Get.width,
        decoration: BoxDecoration(
          color: chatViewConfig.backgroundColor ?? AppColors.background,
          image: chatViewConfig.backgroundImage != null
              ? DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(chatViewConfig.backgroundImage!),
                )
              : null,
        ),
        padding: chatViewConfig.padding,
        margin: chatViewConfig.margin,
        child: <Widget>[
          _buildMessageView(),
          ChatBarWidget(
            onSend: () {},
          ),
        ].toColumn(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChattingController>(
      init: ChattingController(),
      id: "chatting",
      tag: tag,
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: mainAppBarWidget(titleString: 'Chatting'),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
