import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static final routeName = '/category-meal';
  @override
  Widget build(BuildContext context) {
    final Map routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index){

      },
      
      ),
    );
  }
}
