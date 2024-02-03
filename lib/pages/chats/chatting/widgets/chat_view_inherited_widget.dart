import 'package:flutter/material.dart';

import '../models/index.dart';

/// This widget for alternative of excessive amount of passing arguments
/// over widgets.
class ChatViewInheritedWidget extends InheritedWidget {
  const ChatViewInheritedWidget({
    super.key,
    required super.child,
    required this.featureActiveConfig,
    required this.richInputExpandedFocusNode,
    required this.richInputCollapsedFocusNode,
  });

  final FeatureActiveConfig featureActiveConfig;
  final FocusNode richInputExpandedFocusNode;
  final FocusNode richInputCollapsedFocusNode;

  static ChatViewInheritedWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ChatViewInheritedWidget>();

  @override
  bool updateShouldNotify(covariant ChatViewInheritedWidget oldWidget) =>
      oldWidget.featureActiveConfig != featureActiveConfig;
}
