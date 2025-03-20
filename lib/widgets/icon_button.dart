import 'package:flutter/material.dart';

class WAIconButton extends StatelessWidget {
  const WAIconButton({
    super.key,
    this.size,
    required this.onPressed,
    required this.icon,
    this.color,
    this.bgCircleColor,
  });

  final double? size;
  final VoidCallback onPressed;
  final IconData icon;
  final Color? color;
  final Color? bgCircleColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      iconSize: size,
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }
}
