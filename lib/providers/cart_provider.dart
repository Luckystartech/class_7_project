import 'package:class_ecommerce_app/model/cart_item.dart';
import 'package:class_ecommerce_app/model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  ///add to cart
  void addToCart({required Product product}) {
    final bool exist = state.any((item) => item.products.contains(product));

    if (exist) {
      final cartItem = state.firstWhere(
        (item) => item.products.contains(product),
      );
      cartItem.products.add(product);
      state.add(cartItem);
      state = [...state.toSet()];
    } else {
      final cartItem = CartItem(products: [product]);
      state = [...state, cartItem];
    }
    
  }

  ///remove product from cart
  void removeFromCart({required Product product}) {
    final exist = state.any((item) => item.products.contains(product));
    if (exist) {
      final cartItem = state.firstWhere(
        (item) => item.products.contains(product),
      );
      if (cartItem.itemCount == 1) {
        state.remove(cartItem);
        state = [...state];
      }

      state =
          state.map((item) {
            item.products.remove(product);
            return item;
          }).toList();
      state = [...state];
    }

    
  }

  double getTotalPrice() {
    double sum = 0;
    for (var cartItem in state) {
      sum = sum + (cartItem.products[0].price * cartItem.itemCount);
    }
    return sum;
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});






/*


class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]) {
    print(state.length);
  }

  ///add to cart
  void addToCart({required Product product}) {
    final exist = state.any((item) => item.product == product);
    if (exist) {
      final item = state.firstWhere((item) => item.product == product);
      final itemCount = state.where((item) => item.product == product).length;
      final newItem = item.copyWith(
        itemCount: itemCount + 1,
        product: item.product,
      );

      state = [...state, newItem];
    } else {
      state = [...state, CartItem(itemCount: 1, product: product)];
    }
  }

  ///remove product from cart
  void removeFromCart({required Product product}) {
    final exist = state.any((item) => item.product == product);
    if (exist) {
      final item = state.firstWhere((item) => item.product == product);
      final itemCount = state.where((item) => item.product == product).length;
      if (itemCount == 1) {
        state.removeWhere((v) => v.product == item.product);

        state = [...state];
      } else {
        final newItem = item.copyWith(
          itemCount: itemCount - 1,
          product: item.product,
        );
        // state.remove(newItem);
        state.removeWhere((item) => item.product == newItem.product);
        state = [...state];
      }
    }
  }

  double getTotalPrice() {
    double sum = 0;
    for (var cartItem in state) {
      sum = sum + cartItem.product.price;
    }
    return sum;
  }
}

*/