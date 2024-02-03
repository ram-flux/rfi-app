import 'package:flutter/material.dart';

/// 分隔条
class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
    this.size,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 1,
      color: Colors.grey[200],
    );
  }
}
