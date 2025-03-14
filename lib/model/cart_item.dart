import 'package:class_ecommerce_app/model/product.dart';

class CartItem {
  CartItem({required this.itemCount, required this.product});
  int itemCount;
  final Product product;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CartItem &&
      other.product == product;
  }

  @override
  int get hashCode => itemCount.hashCode;

  CartItem copyWith({
    int? itemCount,
    Product? product,
  }) {
    return CartItem(
      itemCount: itemCount ?? this.itemCount,
      product: product ?? this.product,
    );
  }

  @override
  String toString() => 'CartItem(itemCount: $itemCount, product: $product)';
}
