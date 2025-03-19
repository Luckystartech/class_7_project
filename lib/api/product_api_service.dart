import 'dart:convert';
import 'dart:developer';

import 'package:class_ecommerce_app/model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ProductApiService {
  ///get products
  static Future<List<Product>> getProducts() async {
    try {
      final url = 'https://dummyjson.com/products';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['products'] as List<dynamic>;

        final products =
            data.map(((product) => Product.fromMap(product))).toList();
        return products;
      } else {
        throw Exception('Failed to Load Proucts');
      }
    } catch (e) {
      log(e.toString());

      throw Exception('Failed to Load Proucts');
    }
  }
}

final productsProvider = FutureProvider((ref) async {
  return await ProductApiService.getProducts();
});

// void main() async {
//   final products = await ProductApiService.getProducts();
//   print(products);
// }
