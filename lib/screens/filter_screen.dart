import 'package:delimeals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filter";
  Function setFilters;
  Map<String, bool> filters;
  FilterScreen(this.filters, this.setFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var isGlutenFree = false;

  var isVegan = false;

  var isVegetarian = false;

  var isLactoseFree = false;
  @override
  void initState() {
    isGlutenFree = widget.filters['isGlutenFree'];

    isVegan = widget.filters['isVegan'];

    isVegetarian = widget.filters['isVegetarian'];

    isLactoseFree = widget.filters['isLactoseFree'];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.setFilters({
                'isGlutenFree': isGlutenFree,
                'isVegan': isVegan,
                'isVegetarian': isVegetarian,
                'isLactoseFree': isLactoseFree,
              });
            },
          )
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(children: [
        Container(
          child: Text(
            "Filter",
            style: Theme.of(context).textTheme.headline6,
          ),
          margin: EdgeInsets.symmetric(vertical: 10),
        ),
        Expanded(
            child: ListView(
          children: [
            SwitchListTile(
                title: Text("Is Gluten Free"),
                value: isGlutenFree,
                onChanged: (check) {
                  setState(() {
                    isGlutenFree = check;
                  });
                }),
            SwitchListTile(
                title: Text("Is Vegan"),
                value: isVegan,
                onChanged: (check) {
                  setState(() {
                    isVegan = check;
                  });
                }),
            SwitchListTile(
                title: Text("Is Vegetarian"),
                value: isVegetarian,
                onChanged: (check) {
                  setState(() {
                    isVegetarian = check;
                  });
                }),
            SwitchListTile(
                title: Text("Is Lactose Free"),
                value: isLactoseFree,
                onChanged: (check) {
                  setState(() {
                    isLactoseFree = check;
                  });
                })
          ],
        ))
      ]),
    );
  }
}
