import 'package:cached_network_image/cached_network_image.dart';
import 'package:class_ecommerce_app/model/product.dart';
import 'package:class_ecommerce_app/screens/product_detail.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetail(product: product),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: product.images[0],
            width: 130,
            height: 130,
            fit: BoxFit.fitHeight,
            placeholder: (context, url) {
              return CircularProgressIndicator.adaptive();
            },
            errorWidget: (context, url, error) {
              return Center(child: Icon(Icons.error));
            },
          ),
          // Image.network(
          //   // loadingBuilder: (context, _, _) {
          //   //   return CircularProgressIndicator();
          //   // },
          //   product.images[0],
          //   width: 130,
          //   height: 130,
          //   fit: BoxFit.fitHeight,
          // ),
          Text(
            textAlign: TextAlign.center,
            product.title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text('\$${product.price}', style: TextStyle(fontSize: 18)),
          SizedBox(
            width: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, color: Colors.blue, size: 16),
                const SizedBox(width: 8),
                Icon(Icons.circle, color: Colors.amber, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
