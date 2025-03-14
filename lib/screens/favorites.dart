import 'package:cached_network_image/cached_network_image.dart';
import 'package:class_ecommerce_app/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Favorites extends ConsumerWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(favoriteProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body:
          products.isEmpty
              ? Center(child: Text('Favorites is empty'))
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
                            .read(favoriteProvider.notifier)
                            .removeFromFavorite(product);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  );
                },
              ),
    );
  }
}
