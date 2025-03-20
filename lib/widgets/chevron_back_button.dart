import 'package:flutter/material.dart';
import 'package:watchyy/styles/styles.dart';
import 'package:watchyy/widgets/widgets.dart';

class WAChevronBackButton extends StatelessWidget {
  const WAChevronBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: WASpacings.xs.horizontal,
      child: WAIconButton(
        color: Theme.of(context).colorScheme.primary,
        size: WAIconSize.md.size,
        icon: WAIcons.chevronLeft,
        onPressed: Navigator.of(context).pop,
      ),
    );
  }
}
