import 'package:class_ecommerce_app/model/cart_item.dart';
import 'package:class_ecommerce_app/model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<Set<CartItem>> {
  CartNotifier() : super({});

  ///add to cart
  void addToCart({required CartItem cartItem}) {
    final _cartItem = CartItem(itemCount: cartItem.itemCount, product: cartItem.product);
    if (cartItem.itemCount != 0) {
      state = {...state, _cartItem.copyWith(itemCount: _cartItem.itemCount + 1)};
    } else {
      state = {...state, _cartItem};
    }
    // print(state);
  }

  ///remove product from cart
  void removeFromCart({required Product product}) {
    final cartItem = CartItem(itemCount: 0, product: product);
    if (state.contains(cartItem)) {
      if (cartItem.itemCount == 0) {
        state.remove(cartItem);
        state = {...state};
      }
      state = {...state, cartItem.copyWith(itemCount: cartItem.itemCount--)};
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

final cartProvider = StateNotifierProvider<CartNotifier, Set<CartItem>>((ref) {
  return CartNotifier();
});
