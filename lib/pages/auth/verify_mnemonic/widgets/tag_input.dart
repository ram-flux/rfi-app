import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class TagInputWidget extends StatefulWidget {
  final Function(List<String>) onChanged;

  const TagInputWidget({super.key, required this.onChanged});

  @override
  State<TagInputWidget> createState() => _TagInputWidgetState();
}

class _TagInputWidgetState extends State<TagInputWidget> {
  final TextEditingController _textEditingController = TextEditingController();
  final RxList<String> _tags = <String>[].obs;

  void _addTag(String tag) {
    _tags.add(tag);
    _textEditingController.clear();
    widget.onChanged(_tags);
  }

  void _removeTag(String tag) {
    _tags.remove(tag);
    widget.onChanged(_tags);
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Obx(
        () => Wrap(
          spacing: 10,
          children: _tags.map((tag) {
            return Chip(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 0,
                vertical: 0,
              ),
              label: Text(tag),
              deleteIcon: const Icon(
                Icons.close,
                size: 16.0,
              ),
              onDeleted: () => _removeTag(tag),
            );
          }).toList(),
        ),
      ).marginOnly(bottom: 20),
      InputWidget.text(
        controller: _textEditingController,
        hintText: LocaleKeys.authVerifyMnemonicInputHintText.tr,
        fillColor: AppColors.tertiary,
        onChanged: (value) {
          if (value.endsWith(' ')) {
            String tag = value.trim();
            if (tag.isNotEmpty) {
              _addTag(tag);
            }
          }
        },
      ).marginOnly(bottom: 10),
    ].toColumn();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
