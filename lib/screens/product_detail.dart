import 'package:class_ecommerce_app/model/product.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late List<String> imageUrls;

  @override
  void initState() {
    imageUrls = widget.product.images;
    super.initState();
  }

  int selectedImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
        child: Column(
          children: [
            Image.network(
              imageUrls[selectedImageIndex],
              height: MediaQuery.sizeOf(context).height * 0.4,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imageUrls.length, (index) {
                return InkWell(
                  onTap: () {
                    selectedImageIndex = index;
                    setState(() {});
                  },
                  child: Card.outlined(
                    shape: RoundedRectangleBorder(
                      side:
                          selectedImageIndex == index
                              ? BorderSide(width: 8, color: Colors.black12)
                              : BorderSide.none,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(imageUrls[index], width: 80, height: 80,),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange),
                    Text(
                      '${widget.product.rating}',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.black12,
                    foregroundColor: Colors.black,
                  ),
                  child: Text(
                    '${widget.product.review.length} reviews',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  child: Text(
                    widget.product.title,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card.outlined(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 3, color: Colors.blue),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.circle,
                            color: Colors.blue,
                            size: 28,
                          ),
                        ),
                      ),
                      Icon(Icons.circle, color: Colors.amber, size: 32),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Text(
              widget.product.description
             ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${widget.product.price}',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: Size(200, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Add to cart'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
