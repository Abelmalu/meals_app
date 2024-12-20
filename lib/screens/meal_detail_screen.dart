import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal-detail';
  final Function (String) toggleFavorite;
  final Function (String) isFavorite;

  MealDetailScreen(this.toggleFavorite,this.isFavorite);

  Widget buildSectionText(BuildContext ctx, String text) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(text, style: Theme.of(ctx).textTheme.titleLarge),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map routeArgs = ModalRoute.of(context)?.settings.arguments as Map;
    final String mealId = routeArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(mealId)?Icons.star:Icons.star_border),
        onPressed: () {
          toggleFavorite(mealId);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
            buildSectionText(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(ctx).primaryColorLight,
                  child: Text(selectedMeal.ingredients[index]),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionText(context, 'Steps '),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${(index + 1)}'),
                  ),
                  title: Text(selectedMeal.steps[index]),
                ),
                Divider(),
              ]),
              itemCount: selectedMeal.steps.length,
            )),
          ],
        ),
      ),
    );
  }
}
