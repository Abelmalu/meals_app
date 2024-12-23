import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      print(widget.availableMeals.length);
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      print(displayedMeals?.length);
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String>? routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    if (routeArgs == null ||
        routeArgs['id'] == null ||
        routeArgs['title'] == null) {
      // Handle the case where arguments are missing or invalid
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(
          child: Text('Something went wrong!'),
        ),
      );
    }

    final categoryTitle = routeArgs['title']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: Color.fromARGB(117, 143, 46, 8),

      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals![index].id,
              title: displayedMeals![index].title,
              imageUrl: displayedMeals![index].imageUrl,
              duration: displayedMeals![index].duration,
              affordability: displayedMeals![index].affordability,
              complexity: displayedMeals![index].complexity,
            );
          },
          itemCount: displayedMeals
              ?.length // Use '?? 0' to handle null and avoid errors
          ),
    );
  }
}
