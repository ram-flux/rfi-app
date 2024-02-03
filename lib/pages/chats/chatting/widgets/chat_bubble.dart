import 'package:flutter/material.dart';
import 'package:ramflux_app/pages/index.dart';

class ChatBubbleWidget extends StatefulWidget {
  const ChatBubbleWidget({super.key});

  @override
  State<ChatBubbleWidget> createState() => _ChatBubbleWidgetState();
}

class _ChatBubbleWidgetState extends State<ChatBubbleWidget> {
  Widget _messagesWidgetColumn() {
    return Container();
  }

  Widget _buildReceipt() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        // send message to the right，receive message to the left
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // other user profile
          ProfileCircle(
            // reaction to the profile circle
            bottomPadding: 15.0,
            onTap: () {},
            onLongPress: () {},
          ),
          Expanded(
            child: _messagesWidgetColumn(),
          ),
          // sender's message receipt
          _buildReceipt(),
          // sender's profile
          const ProfileCircle(
            bottomPadding: 15,
          ),
        ],
      ),
    );
  }
}
