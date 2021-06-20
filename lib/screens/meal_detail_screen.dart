import 'package:delimeals/data/dummy_data.dart';
import 'package:delimeals/models/meal.dart';
import 'package:delimeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  Function toggleFavMeal;
  Function isFavMeal;
  MealDetailScreen(this.isFavMeal, this.toggleFavMeal);
  @override
  Widget build(BuildContext context) {
    String mealId = ModalRoute.of(context).settings.arguments as String;
    final Meal selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MealItem(
              meal: selectedMeal,
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainerList(ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text(selectedMeal.ingredients[index])),
                    ))),
            buildSectionTitle(context, "Steps"),
            buildContainerList(ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("#${index + 1}"),
                          ),
                          title: Container(
                              padding: EdgeInsets.all(5),
                              child: Text(selectedMeal.steps[index])),
                        ),
                        Divider()
                      ],
                    )))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavMeal(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          toggleFavMeal(mealId);
        },
      ),
    );
  }
}

Widget buildContainerList(Widget child) {
  return Container(
    padding: EdgeInsets.all(10),
    child: child,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(5),
    ),
    height: 150,
    width: 300,
  );
}

Widget buildSectionTitle(BuildContext context, String title) {
  return Container(
    child: Text(
      title,
      style: Theme.of(context).textTheme.headline6,
    ),
    margin: EdgeInsets.symmetric(vertical: 10),
  );
}
