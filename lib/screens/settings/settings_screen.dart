import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:watchyy/i18n/i18n.dart';
import 'package:watchyy/providers/providers.dart';
import 'package:watchyy/styles/styles.dart';
import 'package:watchyy/widgets/widgets.dart';

const _firmwareVersion = 0.18;

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  Widget _buildContent({
    required BuildContext context,
    required EdgeInsetsGeometry padding,
    required WidgetRef ref,
  }) {
    final translations = context.t.screens.settings;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        WASpacings.lg.value,
        padding.vertical,
        WASpacings.lg.value,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translations.info,
            style: AppTheme.of(context).appTypography.headlineSmall,
          ),
          WASpacings.md.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translations.firmware_version,
                style: AppTheme.of(context).appTypography.bodyMedium,
              ),
              Text(
                _firmwareVersion.toString(),
                style: AppTheme.of(context).appTypography.bodyMedium,
              ),
            ],
          ),
          WASpacings.xxl.verticalSpace,
          WAButton(
            onPressed: () =>
                ref.read(productConnectionNotifier.notifier).disconnect(),
            text: 'Disconnect',
            type: WAButtonType.primary,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WAScaffold(
      title: context.t.screens.settings.title,
      largeIosTitle: true,
      slivers: (context, padding) => [
        SliverToBoxAdapter(
          child: _buildContent(
            context: context,
            padding: padding,
            ref: ref,
          ),
        ),
      ],
      bodyBuilder: (context, padding) => _buildContent(
        context: context,
        padding: padding,
        ref: ref,
      ),
    );
  }
}
