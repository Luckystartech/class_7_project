import 'dart:convert';

import 'package:class_ecommerce_app/model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  const LocalStorage();

  //saveData
  Future<void> saveData(List<Product> favorites) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> favouritesJsonData =
        favorites.map((product) => jsonEncode(product.toMap(product))).toList();
    prefs.setStringList('favourite', favouritesJsonData);
  }

  //loadData
  Future<List<Product>> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final favouritesJsonString = prefs.getStringList('favourite');

    if (favouritesJsonString != null) {
      final fav = favouritesJsonString.map((f) => jsonDecode(f)).toList();
      final newFav = fav.map((p) => p as Map<String, dynamic>).toList();
      final favorites = newFav.map((f) => Product.fromMap(f)).toList();
      return favorites;
    } else {
      return [];
    }
  }

  //removeData
}

final localStorageProvider = Provider<LocalStorage>((ref) {
  return LocalStorage();
});
