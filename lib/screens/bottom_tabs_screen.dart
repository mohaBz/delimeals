import 'package:delimeals/models/meal.dart';
import 'package:delimeals/screens/categories_screen.dart';
import 'package:delimeals/screens/favorites_screen.dart';
import 'package:delimeals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class BottomTabsScreen extends StatefulWidget {
  List<Meal> favmeals;
  BottomTabsScreen(this.favmeals);
  @override
  _BottomTabsScreenState createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  int _selectedIndex = 0;
  var screens;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    screens = [CategoriesScreen(), FavoritesScreen(widget.favmeals)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: MainDrawer(),
      ),
      appBar: AppBar(
        title: Text("Meals"),
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
