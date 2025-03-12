import 'package:class_ecommerce_app/api/product_api_service.dart';
import 'package:class_ecommerce_app/model/product.dart';
import 'package:class_ecommerce_app/providers/cart_provider.dart';
import 'package:class_ecommerce_app/screens/cart.dart';
import 'package:class_ecommerce_app/screens/product_detail.dart';
import 'package:class_ecommerce_app/widgets/button_widget.dart';
// import 'package:class_ecommerce_app/widgets/category.dart';
import 'package:class_ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Catalog extends ConsumerStatefulWidget {
  const Catalog({super.key});

  @override
  ConsumerState<Catalog> createState() => _CatalogState();
}

class _CatalogState extends ConsumerState<Catalog> {
  final List<String> categories = [
    'All',
    'Beauty',
    'Fragrances',
    'furniture',
    'groceries',
  ];

 

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
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
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
            icon:
                cart.isEmpty
                    ? Icon(Icons.shopping_cart_outlined)
                    : Badge.count(
                      count: cart.length,
                      child: Icon(Icons.shopping_cart_outlined),
                    ),
          ),
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
            // Category(),
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return ButtonWidget(
                    title: categories[index],
                    onPressed: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    borderRadius: 30,
                    backgroundColor:
                        selectedIndex == index
                            ? Colors.black
                            : Colors.grey.shade200,
                    foregroundColor:
                        selectedIndex == index ? Colors.white : Colors.black,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
              ),
            ),
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
                  final products =
                      selectedIndex == 0
                          ? snapShot.data
                          : snapShot.data!
                              .where(
                                (product) =>
                                    product.category.toLowerCase() ==
                                    categories[selectedIndex].toLowerCase(),
                              )
                              .toList();
                  return GridView.builder(
                    itemCount: products!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 300,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index],
                      );
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


/*
Chair.toLowerCase() 

chair.toLowerCase()

 */