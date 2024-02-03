import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/extensions.dart';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/embeds/widgets/image.dart'
    show getImageProviderByImageSource;
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:ramflux_app/shared/index.dart';

import 'quill/embeds/emoji_embed.dart';

class ChatRichInputWidget extends StatefulWidget {
  const ChatRichInputWidget({
    super.key,
    required this.configurations,
    required this.scrollController,
    required this.focusNode,
  });

  final QuillEditorConfigurations configurations;
  final ScrollController scrollController;
  final FocusNode focusNode;

  @override
  State<ChatRichInputWidget> createState() => _ChatRichInputWidgetState();
}

class _ChatRichInputWidgetState extends State<ChatRichInputWidget> {
  @override
  Widget build(BuildContext context) {
    return QuillEditor(
      focusNode: widget.focusNode,
      scrollController: widget.scrollController,
      configurations: widget.configurations.copyWith(
          sharedConfigurations: const QuillSharedConfigurations(
            extraConfigurations: {
              QuillSharedExtensionsConfigurations.key:
                  QuillSharedExtensionsConfigurations(
                assetsPrefix: 'assets', // Defaults to assets
              ),
            },
          ),
          scrollable: true,
          customStyles: DefaultStyles(
            placeHolder: DefaultTextBlockStyle(
              TextStyle(
                color: AppColors.secondary,
                fontSize: 14,
              ),
              const VerticalSpacing(0, 0),
              const VerticalSpacing(0, 0),
              null,
            ),
            paragraph: DefaultTextBlockStyle(
              TextStyle(
                color: AppColors.onPrimaryContainer,
                fontSize: 14,
              ),
              const VerticalSpacing(0, 0),
              const VerticalSpacing(0, 0),
              null,
            ),
          ),
          embedBuilders: [
            ...FlutterQuillEmbeds.editorBuilders(
              imageEmbedConfigurations: QuillEditorImageEmbedConfigurations(
                imageProviderBuilder: (context, imageUrl) {
                  // cached_network_image is supported
                  // only for Android, iOS and web

                  // We will use it only if image from network
                  if (isAndroid(supportWeb: false) ||
                      isIOS(supportWeb: false) ||
                      isWeb()) {
                    if (isHttpBasedUrl(imageUrl)) {
                      return CachedNetworkImageProvider(
                        imageUrl,
                      );
                    }
                  }
                  return getImageProviderByImageSource(
                    imageUrl,
                    imageProviderBuilder: null,
                    context: context,
                    assetsPrefix: QuillSharedExtensionsConfigurations.get(
                      context: context,
                    ).assetsPrefix,
                  );
                },
              ),
            ),
            EmojiEmbedBuilder(),
          ]),
    );
  }
}
