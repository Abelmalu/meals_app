import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_app/category_meals_screen.dart';
import './categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoriesScreen(),
      routes:{
        CategoryMealsScreen.routeName:(ctx)=>CategoryMealsScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.light(
          secondary: Colors.amber, // This is the new accent color
        ),
        
      ),
    );
  }
}
