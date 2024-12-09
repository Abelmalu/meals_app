import 'package:flutter/material.dart';

class CategoryRecipe {
  final String id;
  final String title;
  final Color color;

 const CategoryRecipe(
      {required this.id, required this.title, this.color = Colors.orange});
}
