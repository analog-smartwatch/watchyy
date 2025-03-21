import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:watchyy/i18n/i18n.dart';
import 'package:watchyy/locations/locations.dart';
import 'package:watchyy/providers/providers.dart';
import 'package:watchyy/styles/styles.dart';
import 'package:watchyy/widgets/widgets.dart';

class MyWatchesScreen extends StatefulHookConsumerWidget {
  const MyWatchesScreen({super.key});

  @override
  MyWatchesScreenState createState() => MyWatchesScreenState();
}

class MyWatchesScreenState extends ConsumerState<MyWatchesScreen> {
  var _products = <Product>[];

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _products = [Product(bluetoothId: 'bluetoothId', name: 'Watchy')];
      });
    });
  }

  void _connect(Product product) {
    ref.read(productConnectionNotifier.notifier).connect(product);
  }

  @override
  Widget build(BuildContext context) {
    final translations = context.t.screens.my_watches;

    return WAScaffold(
      title: translations.title,
      bodyBuilder: (context, padding) {
        if (_products.isEmpty) {
          return Center(
            child: Padding(
              padding: padding + WASpacings.lg.horizontal + WASpacings.md.top,
              child: Text(
                translations.info_no_watch_linked,
                style: AppTheme.of(context).appTypography.bodyMedium,
              ),
            ),
          );
        } else {
          return Padding(
            padding: padding + WASpacings.lg.horizontal + WASpacings.md.top,
            child: Column(
              children: [
                for (final product in _products)
                  ProductListItem(
                    watchIcon: true,
                    name: product.name,
                    onPressed: () => _connect(product),
                  ),
              ],
            ),
          );
        }
      },
      stickyWidget: Padding(
        padding: WASpacings.lg.horizontal,
        child: WAButton(
          onPressed: () => context.push(scanningPath),
          text: translations.button_add_watch,
          type: WAButtonType.primary,
        ),
      ),
    );
  }
}
