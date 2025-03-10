import 'package:class_ecommerce_app/api/product_api_service.dart';
import 'package:class_ecommerce_app/widgets/category.dart';
import 'package:class_ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Catalog extends StatelessWidget {
  const Catalog({super.key});

  @override
  Widget build(BuildContext context) {
    final ktextStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        // leading: IconButton(
        //   onPressed: () {
        //     // Navigator.of(context).pop();
        //   },
        //   icon: Icon(Icons.arrow_back),
        // ),
        actions: [
          Badge.count(count: 2, child: Icon(Icons.shopping_cart_outlined)),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.person_2_outlined),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Discover products', style: ktextStyle),
                FaIcon(FontAwesomeIcons.sliders),
              ],
            ),
            const SizedBox(height: 20),
            Category(),
            Expanded(
              child: FutureBuilder(
                future: ProductApiService.getProducts(),
                builder: (context, snapShot) {
                  //loading state
                  if (snapShot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator.adaptive());
                  }
                  //error state
                  if (snapShot.hasError) {
                    return Center(child: Text(snapShot.error.toString()));
                  }
                  //null and empty
                  if (snapShot.data == null || snapShot.data!.isEmpty) {
                    return Center(child: Text('Oops, No Product Found'));
                  }
                  final products = snapShot.data;
                  return GridView.builder(
                    itemCount: products!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 300,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
