import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmojiEmbed extends Embeddable {
  const EmojiEmbed(
    String value,
  ) : super(emojiType, value);

  static const String emojiType = 'emoji';

  static EmojiEmbed fromDocument(Document document) =>
      EmojiEmbed(jsonEncode(document.toDelta().toJson()));

  Document get document => Document.fromJson(jsonDecode(data));
}

class EmojiEmbedBuilder extends EmbedBuilder {
  @override
  String get key => EmojiEmbed.emojiType;

  @override
  String toPlainText(Embed node) => node.value.data;

  @override
  Widget build(
    BuildContext context,
    QuillController controller,
    Embed node,
    bool readOnly,
    bool inline,
    TextStyle textStyle,
  ) {
    return RichText(
      text: WidgetSpan(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 1),
          child: SvgPicture.asset(
            'assets/emoji/modern/${node.value.data}.svg',
            width: 18,
            height: 18,
          ),
        ),
      ),
    );
  }
}
