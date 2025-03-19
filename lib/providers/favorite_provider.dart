import 'package:class_ecommerce_app/local_storage/local_storage.dart';
import 'package:class_ecommerce_app/model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNotifier extends StateNotifier<List<Product>> {
  FavoriteNotifier({required this.localStorage}) : super([]) {
    init();
  }

  final LocalStorage localStorage;

  void init() {
    loadFavorites();
  }

  void loadFavorites() async {
    final favourites = await localStorage.loadData();
    state = [...state, ...favourites];
  }

  void savefavorites() async {
    await localStorage.saveData(state);
  }

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
    savefavorites();
  }

  void _addToFavorite(Product product) {
    state = [...state, product];
    savefavorites();
  }
}

final favoriteProvider = StateNotifierProvider<FavoriteNotifier, List<Product>>(
  (ref) {
    final localStorage = ref.watch(localStorageProvider);
    return FavoriteNotifier(localStorage: localStorage);
  },
);
