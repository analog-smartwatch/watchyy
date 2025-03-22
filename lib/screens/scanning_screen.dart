import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:watchyy/ble/ble.dart';
import 'package:watchyy/i18n/i18n.dart';
import 'package:watchyy/providers/providers.dart';
import 'package:watchyy/styles/styles.dart';
import 'package:watchyy/widgets/widgets.dart';

class ScanningScreen extends StatelessWidget {
  const ScanningScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      Consumer3<BleScanner, BleScannerState?, BleLogger>(
        builder: (_, bleScanner, bleScannerState, bleLogger, __) =>
            _ScanningScreen(
          scannerState: bleScannerState ??
              const BleScannerState(
                discoveredDevices: [],
                scanIsInProgress: false,
              ),
          startScan: bleScanner.startScan,
          stopScan: bleScanner.stopScan,
          verboseLogging: bleLogger.verboseLogging,
        ),
      );
}

class _ScanningScreen extends StatefulHookConsumerWidget {
  const _ScanningScreen({
    required this.scannerState,
    required this.startScan,
    required this.stopScan,
    required this.verboseLogging,
  });

  final BleScannerState scannerState;
  final void Function(List<Uuid>) startScan;
  final VoidCallback stopScan;
  final bool verboseLogging;

  @override
  _ScanningScreenState createState() => _ScanningScreenState();
}

class _ScanningScreenState extends ConsumerState<_ScanningScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    widget.stopScan();
    super.dispose();
  }

  Future<void> _init() async {
    _startScanning();
  }

  void _startScanning() {
    widget.startScan([]);
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
          onPressed: () => widget.stopScan(),
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
          if (widget.scannerState.scanIsInProgress) ...[
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
    required List<DiscoveredDevice> products,
  }) {
    final translations = context.t.screens.scanning;

    return Padding(
      padding: padding + WASpacings.lg.horizontal + WASpacings.md.top,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.scannerState.scanIsInProgress) ...[
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
          for (final product in products)
            Padding(
              padding: WASpacings.sm.bottom,
              child: ProductListItem(
                name: product.name,
                onPressed: () {},
                // onPressed: () => _connect(product),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final translations = context.t.screens.scanning;
    final scanIsInProgress = widget.scannerState.scanIsInProgress;

    return WAScaffold(
      title: translations.title,
      bodyBuilder: (context, padding) {
        final discoveredDevices = widget.scannerState.discoveredDevices;
        final products =
            discoveredDevices.where((item) => item.name.isNotEmpty).toList();

        if (scanIsInProgress) {
          if (products.isEmpty) {
            return _buildNothingFound(
              context: context,
              padding: padding,
            );
          } else {
            return _buildProductsFound(
              context: context,
              padding: padding,
              products: products,
            );
          }
        } else {
          if (products.isEmpty) {
            return _buildNothingFound(
              context: context,
              padding: padding,
            );
          } else {
            return _buildProductsFound(
              context: context,
              padding: padding,
              products: products,
            );
          }
        }
      },
      stickyWidget: scanIsInProgress
          ? _buildTryAgainButton(context)
          : _buildNewScan(context),
    );
  }
}
