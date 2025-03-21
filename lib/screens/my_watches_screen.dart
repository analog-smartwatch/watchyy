import 'package:flutter/material.dart';
import 'package:watchyy/i18n/i18n.dart';
import 'package:watchyy/styles/styles.dart';
import 'package:watchyy/widgets/widgets.dart';

class MyWatchesScreen extends StatelessWidget {
  const MyWatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = context.t.screens.my_watches;

    return WAScaffold(
      title: translations.title,
      bodyBuilder: (
        BuildContext context,
        EdgeInsetsDirectional padding,
      ) {
        return Center(
          child: Padding(
            padding: padding + WASpacings.lg.horizontal + WASpacings.md.top,
            child: Text(
              translations.info_no_watch_linked,
              style: AppTheme.of(context).appTypography.bodyMedium,
            ),
          ),
        );
      },
      stickyWidget: Padding(
        padding: WASpacings.lg.horizontal,
        child: WAButton(
          onPressed: () {},
          text: translations.button_add_watch,
          type: WAButtonType.primary,
        ),
      ),
    );
  }
}
