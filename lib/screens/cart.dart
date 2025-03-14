import 'package:cached_network_image/cached_network_image.dart';
import 'package:class_ecommerce_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cart extends ConsumerWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(cartProvider).toList();
    final cartNotifier = ref.read(cartProvider.notifier);

    
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body:
          products.isEmpty
              ? Center(child: Text('cart is empty'))
              : Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.75,
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index].product;
                        return ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: product.images[0],
                          ),
                          title: Text(product.title),
                          subtitle: Text('\$${product.price} x ${products[index].itemCount}'),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${cartNotifier.getTotalPrice().toStringAsFixed(2)}', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                        FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            fixedSize: Size(200, 60)
                          ),
                          child: Text(
                            'Check Out',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
