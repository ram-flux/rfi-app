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
  final List<String> _tags = [];

  void _addTag(String tag) {
    setState(() {
      _tags.add(tag);
      _textEditingController.clear();

      widget.onChanged(_tags);
    });
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);

      widget.onChanged(_tags);
    });
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Wrap(
        spacing: 20,
        runSpacing: 10,
        children: _tags.map((tag) {
          return Chip(
            label: Text(tag),
            deleteIcon: const Icon(
              Icons.close,
              size: 16.0,
            ),
            onDeleted: () => _removeTag(tag),
          );
        }).toList(),
      ).marginOnly(bottom: 30),
      InputWidget.text(
        controller: _textEditingController,
        hintText: '输入标签',
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
