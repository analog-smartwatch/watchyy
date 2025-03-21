import 'package:riverpod/riverpod.dart';

class Product {
  Product({
    required this.bluetoothId,
    required this.name,
  });

  final String bluetoothId;
  final String name;
}

class ProductConnectionNotifier extends StateNotifier<Product?> {
  ProductConnectionNotifier() : super(null);

  void connect(Product product) {
    state = product;
  }

  void disconnect() {
    state = null;
  }
}

final productConnectionNotifier =
    StateNotifierProvider<ProductConnectionNotifier, Product?>(
  (ref) => ProductConnectionNotifier(),
);
