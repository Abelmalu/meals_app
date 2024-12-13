import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';


class CategoryMealsScreen extends StatelessWidget {
  static const routeName = 'category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map;

    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return  MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}