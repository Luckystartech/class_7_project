import 'package:class_ecommerce_app/model/product.dart';

class CartItem {
  CartItem({required this.products});

  List<Product> products;

  int get itemCount => products.length;

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is CartItem && other.product.id == product.id;
  // }

  // @override
  // int get hashCode => product.id.hashCode;

  // CartItem copyWith({int? itemCount, Product? product}) {
  //   return CartItem(
  //     itemCount: itemCount ?? this.itemCount,
  //     product: product ?? this.product,
  //   );
  // }

  @override
  String toString() => 'CartItem(itemCount: $itemCount, product: $products)';
}
