import 'package:delimeals/screens/filter_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildTile(IconData icon, String title, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text(
            "Cooking up",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        buildTile(Icons.category, "Categories", () {
          Navigator.of(context).pushNamed('/');
        }),
        buildTile(Icons.filter_list, "Filter", () {
          Navigator.of(context).pushNamed(FilterScreen.routeName);
        }),
      ],
    );
  }
}
