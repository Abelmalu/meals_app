

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'screens/categories_screen.dart';

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
        MealDetailScreen.routeName: (ctx)=>MealDetailScreen(),
      },
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.light(
          secondary: Colors.amber, // This is the new accent color

        ),
        // textTheme:ThemeData.light().textTheme.copyWith(
        //   bodyText1: TextStyle(
        //     color:Color.fromRGBO(28, 51, 51, 1)
        //   ),
        //   bodyText2: TextStyle(
        //     color:Color.fromRGBO(28, 51, 51, 1)
        //   ),
        //   titleLarge: TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //   )
        // ),
        
      ),
    );
  }
}
