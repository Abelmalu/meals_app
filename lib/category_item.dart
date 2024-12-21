import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String imageUrl;

  CategoryItem(this.title, this.color, this.id,this.imageUrl);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,arguments: {'id':id, 'title':title}

    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 0),
        height:250,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
         
          borderRadius: BorderRadius.circular(15),
        ),
        
        child: Column(
          mainAxisSize:MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(imageUrl,fit:BoxFit.cover, height: 50,),
            SizedBox(height: 5,),
            Expanded(child: Text(title, style:TextStyle(fontWeight: FontWeight.bold)),),
          ],
        ),
      ),
    );
  }
}
