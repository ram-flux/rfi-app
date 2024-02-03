import 'package:flutter/material.dart';

import '../index.dart';

/// Extension on State for accessing inherited widget.
extension StatefulWidgetExtension on State {
  ChatViewInheritedWidget? get provide => ChatViewInheritedWidget.of(context);
}
