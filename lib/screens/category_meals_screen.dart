import 'package:delimeals/data/dummy_data.dart';
import 'package:delimeals/models/meal.dart';
import 'package:delimeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  var catTitle;
  List<Meal> categoryMeals;
  var isInitLoad = false;

  @override
  void didChangeDependencies() {
    if (!isInitLoad) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      catTitle = routeArgs['title'];
      final catId = routeArgs['id'];
      categoryMeals = DUMMY_MEALS.where((element) {
        return element.categories.contains(catId);
      }).toList();
      isInitLoad = true;
    }

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: categoryMeals[index],
            removeItem: _removeItem,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
