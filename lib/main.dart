import 'package:delimeals/data/dummy_data.dart';
import 'package:delimeals/models/meal.dart';
import 'package:delimeals/screens/bottom_tabs_screen.dart';
import 'package:delimeals/screens/categories_screen.dart';
import 'package:delimeals/screens/category_meals_screen.dart';
import 'package:delimeals/screens/filter_screen.dart';
import 'package:delimeals/screens/meal_detail_screen.dart';
import 'package:delimeals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _slectedMeals = DUMMY_MEALS;
  Map<String, bool> filters;
  @override
  void initState() {
    filters = {
      'isGlutenFree': false,
      'isVegan': false,
      'isVegetarian': false,
      'isLactoseFree': false,
    };
    // TODO: implement initState
    super.initState();
  }

  void setFilters(Map<String, bool> filterList) {
    setState(() {
      filters = filterList;
      _slectedMeals = DUMMY_MEALS.where((element) {
        if (!element.isGlutenFree && filters['isGlutenFree']) {
          return false;
        }
        if (!element.isVegan && filters['isVegan']) {
          return false;
        }
        if (!element.isVegetarian && filters['isVegetarian']) {
          return false;
        }
        if (!element.isLactoseFree && filters['isLactoseFree']) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (ctx) => BottomTabsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_slectedMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(filters, setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
