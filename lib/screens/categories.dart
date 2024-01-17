import 'package:flutter/material.dart';
import 'package:reusemart_app/services/utils.dart';
import 'package:reusemart_app/widgets/categories_widget.dart';
import 'package:reusemart_app/widgets/text_widget.dart';

// ignore: must_be_immutable
class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/cat/book2.png',
      'catText': 'Books',
    },
    {
      'imgPath': 'assets/images/cat/veg.png',
      'catText': 'Appliances',
    },
    {
      'imgPath': 'assets/images/cat/Spinach.png',
      'catText': 'Mobiles',
    },
    {
      'imgPath': 'assets/images/cat/nuts.png',
      'catText': 'Laptops',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'Categories',
            color: color,
            textSize: 24,
            isTitle: true,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 240 / 280,
            crossAxisSpacing: 30, // Vertical spacing
            mainAxisSpacing: 35, // Horizontal spacing
            children: List.generate(4, (index) {
              return CategoriesWidget(
                catText: catInfo[index]['catText'],
                imgPath: catInfo[index]['imgPath'],
                passedColor: gridColors[index],
              );
            }),
          ),
        ));
  }
}
