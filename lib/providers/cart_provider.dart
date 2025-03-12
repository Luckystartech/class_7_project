import 'package:class_ecommerce_app/model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  ///add to cart
  void addToCart({required Product product}) {
    state = [...state, product];
  }

  ///remove product from cart
  void removeFromCart({required Product product}) {
    state.removeAt(state.indexOf(product));
    state = [...state];
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>((ref) {
  return CartNotifier();
});
