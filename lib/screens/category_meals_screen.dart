import 'package:delimeals/data/dummy_data.dart';
import 'package:delimeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = 'category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catTitle = routeArgs['title'];
    final catId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(catId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: categoryMeals[index],
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
