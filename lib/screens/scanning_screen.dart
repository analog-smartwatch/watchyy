import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:watchyy/i18n/i18n.dart';
import 'package:watchyy/providers/providers.dart';
import 'package:watchyy/styles/styles.dart';
import 'package:watchyy/widgets/widgets.dart';

class ScanningScreen extends StatefulHookConsumerWidget {
  const ScanningScreen({super.key});

  @override
  ScanningScreenState createState() => ScanningScreenState();
}

class ScanningScreenState extends ConsumerState<ScanningScreen> {
  var _scanning = true;
  var _products = <Product>[];

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    //TODO: delete this
    setState(() {
      _scanning = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _products = [Product(bluetoothId: 'bluetoothId', name: 'Watchy')];
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _scanning = false;
      });
    });
  }

  void _connect(Product product) {
    ref.read(productConnectionNotifier.notifier).connect(product);
  }

  Widget _buildHeader({
    required BuildContext context,
    required String name,
  }) {
    return Row(
      children: [
        Icon(
          WAIcons.bluetooth,
          color: Theme.of(context).colorScheme.primary,
        ),
        WASpacings.sm.horizontalSpace,
        Text(
          name,
          style: AppTheme.of(context).appTypography.headlineSmall,
        ),
      ],
    );
  }

  Widget _buildTryAgainButton(BuildContext context) => Padding(
        padding: WASpacings.lg.horizontal,
        child: WAButton(
          text: context.t.screens.scanning.stop_scan,
          type: WAButtonType.secondary,
          onPressed: context.pop,
        ),
      );

  Widget _buildNewScan(BuildContext context) => Padding(
        padding: WASpacings.lg.horizontal,
        child: WAButton(
          text: context.t.screens.scanning.new_scan,
          type: WAButtonType.primary,
          onPressed: _init,
        ),
      );

  Widget _buildNothingFound({
    required BuildContext context,
    required EdgeInsetsDirectional padding,
  }) {
    final translations = context.t.screens.scanning;

    return Padding(
      padding: padding + WASpacings.lg.horizontal + WASpacings.md.top,
      child: Column(
        children: [
          if (_scanning) ...[
            WASpacings.xxl.verticalSpace,
            const Center(child: WASpinner()),
            WASpacings.xxl.verticalSpace,
          ] else ...[
            WASpacings.xxl.verticalSpace,
            Icon(
              WAIcons.closeCircle,
              color: Theme.of(context).colorScheme.error,
              size: 40,
            ),
            WASpacings.xxl.verticalSpace,
          ],
          Center(
            child: Text(
              translations.nothing_found,
              style: AppTheme.of(context).appTypography.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsFound({
    required BuildContext context,
    required EdgeInsetsDirectional padding,
  }) {
    final translations = context.t.screens.scanning;

    return Padding(
      padding: padding + WASpacings.lg.horizontal + WASpacings.md.top,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_scanning) ...[
            WASpacings.xxl.verticalSpace,
            const Center(child: WASpinner()),
            WASpacings.xxl.verticalSpace,
            _buildHeader(
              context: context,
              name: translations.around_me,
            ),
          ] else ...[
            _buildHeader(
              context: context,
              name: translations.found,
            ),
          ],
          WASpacings.xl.verticalSpace,
          for (final product in _products)
            ProductListItem(
              name: product.name,
              onPressed: () => _connect(product),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final translations = context.t.screens.scanning;

    return WAScaffold(
      title: translations.title,
      bodyBuilder: (context, padding) {
        if (_scanning) {
          if (_products.isEmpty) {
            return _buildNothingFound(context: context, padding: padding);
          } else {
            return _buildProductsFound(context: context, padding: padding);
          }
        } else {
          if (_products.isEmpty) {
            return _buildNothingFound(context: context, padding: padding);
          } else {
            return _buildProductsFound(context: context, padding: padding);
          }
        }
      },
      stickyWidget:
          _scanning ? _buildTryAgainButton(context) : _buildNewScan(context),
    );
  }
}
