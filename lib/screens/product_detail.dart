import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final List<String> imageUrls = [
    'assets/images/chair_1.png',
    'assets/images/chair_2.png',
  ];

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
            Image.asset(
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
                      child: Image.asset(imageUrls[index], width: 80),
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
                      '4.8',
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
                    '145 reviews',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Leset Galant',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an"),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('\$64.00', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                FilledButton(onPressed: (){}, style: FilledButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: Size(200, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ), child: Text('Add to cart'),)
              ],),
            )
          ],
        ),
      ),
    );
  }
}
