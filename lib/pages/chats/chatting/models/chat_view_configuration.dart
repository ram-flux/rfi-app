import 'package:flutter/material.dart';

import '../values/typedefs.dart';

class ChatViewConfiguration {
  /// Provides background color of chat view.
  final Color? backgroundColor;

  /// Provides background image of chat view.
  final String? backgroundImage;

  /// Provides padding of chat view.
  final EdgeInsetsGeometry? padding;

  /// Provides margin of chat view.
  final EdgeInsetsGeometry? margin;

  /// Provides height of chat view.
  final double? height;

  /// Provides width of chat view.
  final double? width;

  /// Provides configurations of chat separator widget.
  final StringWithReturnWidget? groupSeparatorBuilder;

  /// Used to give text style of message's time while user swipe to see time of
  /// message.
  final TextStyle? messageTimeTextStyle;

  /// Used to give colour of message's time while user swipe to see time of
  /// message.
  final Color? messageTimeIconColor;

  /// Used to give configuration of default chat separator widget.
  final DefaultGroupSeparatorConfiguration? defaultGroupSeparatorConfig;

  /// Used for giving widget while data is loading.
  final Widget? loadingWidget;

  /// Used to give curve of animation which runes while user swipe to see time of
  /// message.
  final Curve messageTimeAnimationCurve;

  const ChatViewConfiguration({
    this.backgroundColor,
    this.backgroundImage,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.groupSeparatorBuilder,
    this.messageTimeTextStyle,
    this.messageTimeIconColor,
    this.defaultGroupSeparatorConfig,
    this.loadingWidget,
    this.messageTimeAnimationCurve = Curves.decelerate,
  });
}

class DefaultGroupSeparatorConfiguration {
  /// Used for giving padding of chat separator widget.
  final EdgeInsetsGeometry? padding;

  /// Used for giving text style of chat separator widget.
  final TextStyle? textStyle;

  const DefaultGroupSeparatorConfiguration({
    this.padding,
    this.textStyle,
  });
}
