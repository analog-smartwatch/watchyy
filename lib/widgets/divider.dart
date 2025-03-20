import 'package:flutter/material.dart';
import 'package:watchyy/styles/styles.dart';

const _height = 4.0;

class WADivider extends StatelessWidget {
  const WADivider({
    super.key,
    this.padding,
  });

  final EdgeInsetsGeometry? padding;

  static double height = _height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? WASpacings.zero.horizontal,
      child: Divider(
        height: _height,
        thickness: 0.8,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}
