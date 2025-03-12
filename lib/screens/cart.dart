import 'package:cached_network_image/cached_network_image.dart';
import 'package:class_ecommerce_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cart extends ConsumerWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body:
          products.isEmpty
              ? Center(child: Text('cart is empty'))
              : ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
                    leading: CachedNetworkImage(imageUrl: product.images[0]),
                    title: Text(product.title),
                    subtitle: Text('\$${product.price}'),
                    trailing: IconButton(
                      onPressed: () {
                        ref
                            .read(cartProvider.notifier)
                            .removeFromCart(product: product);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  );
                },
              ),
    );
  }
}
