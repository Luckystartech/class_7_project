import 'package:cached_network_image/cached_network_image.dart';
import 'package:class_ecommerce_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cart extends ConsumerWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider).toSet().toList();
    final cartNotifier = ref.read(cartProvider.notifier);

    // final filteredProducts =
    //     products.map((item) {
    //       return products.lastWhere((v) => v.product == item.product);

    //     }).toSet().toList();

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body:
          cartItems.isEmpty
              ? Center(child: Text('cart is empty'))
              : Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.75,
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        // products.toSet();
                        final cartItem = cartItems[index];

                        return ListTile(
                          // minLeadingWidth: 40,
                          leading: CachedNetworkImage(
                            imageUrl: cartItem.products[0].images[0],
                            width: 40,
                            height: 40,
                          ),
                          title: Text(cartItem.products[0].title),
                          subtitle: Text(
                            '\$${cartItem.products[0].price} x ${cartItem.itemCount}',
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              ref
                                  .read(cartProvider.notifier)
                                  .removeFromCart(product: cartItem.products[0]);
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
                        Text(
                          '\$${cartNotifier.getTotalPrice().toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            fixedSize: Size(200, 60),
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
