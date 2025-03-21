import 'package:flutter/material.dart';
import 'package:watchyy/i18n/i18n.dart';
import 'package:watchyy/styles/styles.dart';
import 'package:watchyy/widgets/widgets.dart';

const _smartchWatchName = "Paul's smartwatch";
const _batteryLevel = 87;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildContent({
    required BuildContext context,
    required EdgeInsetsGeometry padding,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        WASpacings.lg.value,
        padding.vertical,
        WASpacings.lg.value,
        0,
      ),
      child: Text(
        context.t.screens.home.battery_level(level: _batteryLevel),
        style: AppTheme.of(context).appTypography.bodyMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WAScaffold(
      title: _smartchWatchName,
      largeIosTitle: true,
      slivers: (context, padding) => [
        SliverToBoxAdapter(
          child: _buildContent(
            context: context,
            padding: padding,
          ),
        ),
      ],
      bodyBuilder: (context, padding) =>
          _buildContent(context: context, padding: padding),
    );
  }
}
