import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchyy/styles/styles.dart';

typedef RefreshCallback = Future<void> Function();

typedef SliverBuilder = List<Widget> Function(
  BuildContext context,
  EdgeInsetsDirectional padding,
);

class WAScaffold extends StatelessWidget {
  const WAScaffold({
    super.key,
    required this.bodyBuilder,
    this.slivers,
    this.title = '',
    this.actions,
    this.leading,
    this.stickyWidget,
    this.largeIosTitle = false,
    this.scrollController,
  }) : assert(
          !largeIosTitle || (largeIosTitle && slivers != null),
          'if largeIosTitle is true, then define slivers',
        );

  final Widget Function(BuildContext, EdgeInsetsDirectional) bodyBuilder;
  final SliverBuilder? slivers;
  final String title;
  final List<Widget>? actions;
  final Widget? stickyWidget;
  final Widget? leading;
  final bool largeIosTitle;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final platform = getPlatform(context);
    final isDarkMode = isAppInDarkMode(context);
    final colorScheme = Theme.of(context).colorScheme;
    final appTypography = AppTheme.of(context).appTypography;

    final android = Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: actions,
        leading: leading,
        title: Text(
          title,
          style: appTypography.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: bodyBuilder(
        context,
        EdgeInsetsDirectional.only(
          top: WASpacings.zero.value,
          bottom: WASpacings.zero.value,
        ),
      ),
    );

    final backgroundColor = isDarkMode
        ? Colors.black.withValues(alpha: 0.7)
        : Colors.white.withValues(alpha: 0.8);

    final trailingChildren = <Widget>[];
    final Widget trailing = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: trailingChildren,
    );

    if (actions case final actions?) {
      if (actions.isNotEmpty) {
        actions.forEach(trailingChildren.add);
      } else {
        trailingChildren.add(const SizedBox.shrink());
      }
    }

    Widget ios = CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: backgroundColor,
        trailing: trailing,
        middle: Text(
          title,
          style: TextStyle(
            color: colorScheme.onSurface,
          ),
        ),
      ),
      child: bodyBuilder(
        context,
        EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).padding.top +
              const CupertinoNavigationBar().preferredSize.height,
          bottom: WASpacings.zero.value,
        ),
      ),
    );

    final bodyBuilderSlivers = slivers ??
        (context, padding) => [
              const Scaffold(
                body: SizedBox.shrink(),
              ),
            ];

    if (largeIosTitle) {
      ios = CustomScrollView(
        controller: scrollController,
        slivers: [
          CupertinoSliverNavigationBar(
            trailing: trailing,
            border: const Border(
              bottom: BorderSide(color: Colors.transparent),
            ),
            backgroundColor: backgroundColor,
            largeTitle: Text(
              title,
              style: TextStyle(
                color: colorScheme.onSurface,
              ),
            ),
          ),
          ...bodyBuilderSlivers(
            context,
            EdgeInsetsDirectional.only(
              top: WASpacings.sm.value,
              bottom: WASpacings.zero.value,
            ),
          ),
        ],
      );
    }

    final widget = switch (platform) {
      TargetPlatform.android => android,
      TargetPlatform.iOS => ios,
      _ => android,
    };

    if (stickyWidget case final stickyWidget?) {
      return Stack(
        children: [
          widget,
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).padding.bottom + WASpacings.lg.value,
            child: stickyWidget,
          ),
        ],
      );
    }

    return widget;
  }
}
