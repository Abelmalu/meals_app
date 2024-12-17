import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/category_item.dart';


class CategoriesScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('delimeal'),),

     body: GridView(
      padding:EdgeInsets.all(15),
      gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children:
          DUMMY_CATEGORIES.map((e) => CategoryItem(e.title, e.color,e.id)).toList(),

      ),
    );
  }
}
