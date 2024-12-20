import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      print("Filters: $_filters");
      print('DUMMYMEALS - ${DUMMY_MEALS.length}');

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
      print('availablemeals - ${_availableMeals.length}');
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(_setFilters, _filters),
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
