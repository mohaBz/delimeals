import 'package:delimeals/models/meal.dart';
import 'package:delimeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("You don't have any favorite meals yet"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: favoriteMeals[index],
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
