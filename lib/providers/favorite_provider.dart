import 'package:class_ecommerce_app/model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNotifier extends StateNotifier<List<Product>> {
  FavoriteNotifier() : super([]);

  void toggleFavourite({required Product product}) {
    if (state.contains(product)) {
      removeFromFavorite(product);
    } else {
      _addToFavorite(product);
    }
  }

  void removeFromFavorite(Product product) {
    state.remove(product);
    state = [...state];
  }

  void _addToFavorite(Product product) {
    state = [...state, product];
  }
}

final favoriteProvider = StateNotifierProvider<FavoriteNotifier, List<Product>>(
  (ref) {
    return FavoriteNotifier();
  },
);
