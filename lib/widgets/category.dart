import 'package:class_ecommerce_app/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<StatefulWidget> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<String> categories = ['Beauty', 'Fragrances', 'furniture', 'groceries'];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                selectedIndex == index ? Colors.black : Colors.grey.shade200,
            foregroundColor:
                selectedIndex == index ? Colors.white : Colors.black,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }
}

/*

Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonWidget(
          title: 'Sofas',
          onPressed: () {},
          borderRadius: 30,
          backgroundColor: Colors.grey.shade200,
        ),
        ButtonWidget(
          title: 'Chairs',
          onPressed: () {},
          borderRadius: 30,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        ButtonWidget(
          title: 'Tables',
          onPressed: () {},
          borderRadius: 30,
          backgroundColor: Colors.grey.shade200,
        ),
        ButtonWidget(
          title: 'Kitchen',
          onPressed: () {},
          borderRadius: 30,
          backgroundColor: Colors.grey.shade200,
        ),
      ],
    );

*/
