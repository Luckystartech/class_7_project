import 'package:class_ecommerce_app/screens/product_detail.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => ProductDetail()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/chair_1.png',
            width: 200,
            fit: BoxFit.cover,
          ),
          Text(
            'Chester Chair',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text('\$61.00', style: TextStyle(fontSize: 18)),
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
