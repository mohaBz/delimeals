import 'package:delimeals/screens/categories_screen.dart';
import 'package:delimeals/screens/favorites_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          bottom: TabBar(tabs: [
            Tab(
              text: "Categories",
              icon: Icon(
                Icons.category,
              ),
            ),
            Tab(
              text: "Favorites",
              icon: Icon(
                Icons.star,
              ),
            ),
          ]),
        ),
        // body: TabBarView(children: [CategoriesScreen(), FavoritesScreen()]),
      ),
    );
  }
}
