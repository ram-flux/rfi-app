import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import '../values/enumaration.dart';
import 'quill/embeds/emoji_embed.dart';
import 'package:ramflux_app/shared/index.dart';

import '../index.dart';

class ChatBarWidget extends StatefulWidget {
  const ChatBarWidget({super.key, required this.onSend});

  final Function onSend;
  @override
  State<ChatBarWidget> createState() => _ChatBarWidgetState();
}

class _ChatBarWidgetState extends State<ChatBarWidget> {
  final QuillController _quillController = QuillController.basic();
  final ScrollController _richInputExpandedScrollController =
      ScrollController();
  final ScrollController _richInputCollapsedScrollController =
      ScrollController();

  final Rx<ActionBarValues> _actionBarValue = ActionBarValues.none.obs;

  late OverlayEntry overlayEntry;

  QuillEditorConfigurations get configurations => QuillEditorConfigurations(
        controller: _quillController,
        placeholder: "Type a message",
      );

  // 切换 emoji picker
  void _toggleEmojiPickerVisible() {
    _actionBarValue.value = _actionBarValue.value == ActionBarValues.emoji
        ? ActionBarValues.none
        : ActionBarValues.emoji;
  }

  // 切换录音选择器
  void _toggleVoiceRecorderVisible() {
    _actionBarValue.value = _actionBarValue.value == ActionBarValues.voice
        ? ActionBarValues.none
        : ActionBarValues.voice;
  }

  // 切换图片选择器
  void _toggleImagePickerVisible() {
    _actionBarValue.value = _actionBarValue.value == ActionBarValues.image
        ? ActionBarValues.none
        : ActionBarValues.image;
  }

  // 选择 emoji
  void _onEmojiSelected(String emoji) {
    // 如果输入框为空，先插入一个 ZeroWidthSpace（零宽度空格）字符
    if (_quillController.document.length == 1) {
      _quillController.document.insert(
        _quillController.selection.extentOffset,
        String.fromCharCode(8203),
      );
      _quillController.moveCursorToEnd();
    }

    // 插入 emoji
    _quillController.document.insert(
      _quillController.selection.extentOffset,
      EmojiEmbed(emoji),
    );
    _quillController.moveCursorToEnd();

    if (overlayEntry.mounted) {
      provide!.richInputExpandedFocusNode.unfocus();
      if (_richInputExpandedScrollController.hasClients) {
        _richInputExpandedScrollController.animateTo(
          _richInputExpandedScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
        );
      }
    } else {
      provide!.richInputCollapsedFocusNode.unfocus();
      if (_richInputCollapsedScrollController.hasClients) {
        _richInputCollapsedScrollController.animateTo(
          _richInputCollapsedScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  // 选择文件
  Future<void> _pickFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      for (PlatformFile file in result.files) {
        debugPrint(file.name);
        debugPrint(file.bytes.toString());
        debugPrint(file.size.toString());
        debugPrint(file.extension);
        debugPrint(file.path);
      }
    }
  }

  // 重置为初始状态
  void _reset() {
    _actionBarValue.value = ActionBarValues.none;
    provide!.richInputCollapsedFocusNode.unfocus();
    provide!.richInputExpandedFocusNode.unfocus();
  }

  @override
  void initState() {
    super.initState();
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: _buildExpandedView(),
        );
      },
    );

    // 监听输入框内容变化，删除 ZeroWidthSpace（零宽度空格）字符
    _quillController.document.changes.listen((event) {
      if (_quillController.document.length == 2 &&
          _quillController.document.toPlainText().contains(
                String.fromCharCode(8203),
              )) {
        _quillController.document.delete(0, 1);
        _quillController.moveCursorToEnd();
      }
    });
  }

  // 全屏视图
  Widget _buildExpandedView() {
    return <Widget>[
      ChatRichInputWidget(
        scrollController: _richInputExpandedScrollController,
        focusNode: provide!.richInputExpandedFocusNode,
        configurations: configurations.copyWith(
          padding: const EdgeInsets.only(
            top: 6,
            bottom: 10,
            left: 10,
            right: 10,
          ),
          maxHeight: null,
          minHeight: null,
          expands: true,
          builder: (context, rawEditor) {
            return _buildChatRichInputExpandedContainer(rawEditor);
          },
        ),
      ).expanded(),
    ]
        .toColumn(
          mainAxisSize: MainAxisSize.min,
        )
        .paddingOnly(top: Get.context!.mediaQueryPadding.top);
  }

  // 非全屏视图
  Widget _buildView() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      padding: MediaQuery.of(context).viewInsets,
      color: AppColors.tertiary,
      child: <Widget>[
        ChatRichInputWidget(
          scrollController: _richInputCollapsedScrollController,
          focusNode: provide!.richInputCollapsedFocusNode,
          configurations: configurations.copyWith(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 10,
              right: 0,
            ),
            maxHeight: 90,
            minHeight: 36,
            expands: false,
            builder: (context, rawEditor) {
              return _buildChatRichInputCollapsedContainer(rawEditor);
            },
          ),
        ),
        _buildActionBar(),
        Obx(
          () => Stack(
            children: [
              Offstage(
                offstage: _actionBarValue.value != ActionBarValues.emoji,
                child: EmojiPickerWidget(
                  onEmojiSelected: _onEmojiSelected,
                ),
              ),
              Offstage(
                offstage: _actionBarValue.value != ActionBarValues.voice,
                child: const VoiceRecorderWidget(),
              ),
              if (_actionBarValue.value == ActionBarValues.image)
                const ImagePickerWidget(),
            ],
          ),
        ),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .padding(all: AppSpace.bottomView)
          .safeArea(),
    );
  }

  // 全屏输入框的视图
  Widget _buildChatRichInputExpandedContainer(QuillRawEditor rawEditor) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.onPrimary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.zero,
      child: <Widget>[
        InkWell(
          onTap: () {
            overlayEntry.remove();
          },
          child: Container(
            constraints: BoxConstraints.tight(
              const Size.square(22.0),
            ), // 设置宽高为24.0
            padding: const EdgeInsets.all(0), // 设置padding为0
            child: IconWidget.svg(
              AssetsIcons.returnUpBackSvg,
            ),
          ).marginOnly(
            right: 10,
            top: 6,
          ),
        ),
        rawEditor.expanded(),
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }

  // 非全屏输入框的视图
  Widget _buildChatRichInputCollapsedContainer(QuillRawEditor rawEditor) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.onPrimary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.zero,
      child: <Widget>[
        Expanded(
          child: rawEditor,
        ),
        InkWell(
          onTap: () {
            OverlayState overlayState = Overlay.of(context);
            overlayState.insert(overlayEntry);
            provide!.richInputExpandedFocusNode.requestFocus();
          },
          child: Container(
            constraints: BoxConstraints.tight(
              const Size.square(22.0),
            ),
            padding: const EdgeInsets.all(0),
            child: IconWidget.svg(
              AssetsIcons.openInFullSvg,
            ),
          ).marginOnly(right: 8, bottom: 6),
        ),
      ].toRow(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
      ),
    );
  }

  // Action bar
  Widget _buildActionBar() {
    return <Widget>[
      // emoji
      ButtonWidget.icon(
        Obx(
          () => IconWidget.svg(
            AssetsIcons.emojiIconSvg,
            size: 24,
            color: _actionBarValue.value == ActionBarValues.emoji
                ? AppColors.primary
                : null,
          ),
        ),
        width: 34,
        height: 34,
        onTap: () {
          _toggleEmojiPickerVisible();
        },
      ),
      // voice
      ButtonWidget.icon(
        Obx(
          () => IconWidget.svg(
            AssetsIcons.micIconSvg,
            size: 24,
            color: _actionBarValue.value == ActionBarValues.voice
                ? AppColors.primary
                : null,
          ),
        ),
        width: 34,
        height: 34,
        onTap: () {
          _toggleVoiceRecorderVisible();
        },
      ),
      // attach
      ButtonWidget.icon(
        IconWidget.svg(
          AssetsIcons.attachIconSvg,
          size: 24,
        ),
        width: 34,
        height: 34,
        onTap: _pickFiles,
      ),
      // image
      ButtonWidget.icon(
        Obx(
          () => IconWidget.svg(
            AssetsIcons.imageIconSvg,
            size: 24,
            color: _actionBarValue.value == ActionBarValues.image
                ? AppColors.primary
                : null,
          ),
        ),
        width: 34,
        height: 34,
        onTap: _toggleImagePickerVisible,
      ),
      // send
      StreamBuilder(
        stream: _quillController.document.changes,
        builder: (context, snapshot) {
          return ButtonWidget.icon(
            IconWidget.svg(
              AssetsIcons.sendIconSvg,
              size: 20,
              color: _quillController.obs.value.document.isEmpty()
                  ? null
                  : AppColors.primary,
            ),
            width: 34,
            height: 34,
            onTap: () {},
          ).marginOnly(right: 4).alignRight().expanded(flex: 1);
        },
      ),
    ].toRow().marginSymmetric(vertical: 4);
  }

  @override
  Widget build(BuildContext context) {
    provide!.richInputCollapsedFocusNode.addListener(() {
      if (provide!.richInputCollapsedFocusNode.hasFocus) {
        _reset();
        provide!.richInputCollapsedFocusNode.requestFocus();
      }
    });
    provide!.richInputExpandedFocusNode.addListener(() {
      if (provide!.richInputExpandedFocusNode.hasFocus) {
        _reset();
        provide!.richInputExpandedFocusNode.requestFocus();
      }
    });

    return _buildView();
  }

  @override
  void dispose() {
    _quillController.dispose();
    _richInputExpandedScrollController.dispose();
    _richInputCollapsedScrollController.dispose();
    super.dispose();
  }
}
