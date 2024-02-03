import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

import '../index.dart';

class ChatMessageListWidget extends StatefulWidget {
  const ChatMessageListWidget({super.key});

  @override
  State<ChatMessageListWidget> createState() => _ChatMessageListWidgetState();
}

class _ChatMessageListWidgetState extends State<ChatMessageListWidget> {
  /// TODO: ovlerlay actions
  @override
  Widget build(BuildContext context) {
    /// TODO: StreamBuilder
    return GroupedListView(
      shrinkWrap: true,
      reverse: true,
      elements: const [],
      groupBy: (element) => element.createdAt.getDateFromDateTime,
      itemComparator: (message1, message2) =>
          message1.message.compareTo(message2.message),
      physics: const NeverScrollableScrollPhysics(),
      order: GroupedListOrder.DESC,
      groupSeparatorBuilder: (separator) =>
          Text(separator, textAlign: TextAlign.center),
      indexedItemBuilder: (context, message, index) {
        return ValueBuilder(
          initialValue: '',
          builder: (value, updateFn) {
            return const ChatBubbleWidget();
          },
        );
      },
    );
  }
}
