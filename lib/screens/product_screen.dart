import 'package:class_ecommerce_app/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(title: 'Sofas', onPressed: () {}, borderRadius: 30, backgroundColor: Colors.grey.shade200,),
                ButtonWidget(title: 'Chairs', onPressed: () {}, borderRadius: 30, backgroundColor: Colors.black, foregroundColor: Colors.white,),
                ButtonWidget(title: 'Tables', onPressed: () {}, borderRadius: 30, backgroundColor: Colors.grey.shade200,),
                ButtonWidget(title: 'Kitchen', onPressed: () {}, borderRadius: 30, backgroundColor: Colors.grey.shade200,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
