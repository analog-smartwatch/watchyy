import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchyy/styles/styles.dart';

class WASpinner extends StatelessWidget {
  const WASpinner({super.key});

  @override
  Widget build(BuildContext context) {
    final platform = getPlatform(context);

    return switch (platform) {
      TargetPlatform.iOS => CupertinoActivityIndicator(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      _ => Padding(
          padding: WASpacings.sm.all,
          child: const CircularProgressIndicator(),
        ),
    };
  }
}
