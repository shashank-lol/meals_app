import 'package:flutter/material.dart';

import 'package:meals_app/widgets/switch_filter_tile.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(this.filter, {super.key});

  final Map<Filter, bool> filter;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isLactoseFree = false;
  var isVegetarian = false;
  var isVegan = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isGlutenFree =widget.filter[Filter.glutenFree]!;
    isLactoseFree =widget.filter[Filter.lactoseFree]!;
    isVegetarian =widget.filter[Filter.vegetarian]!;
    isVegan =widget.filter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: isGlutenFree,
            Filter.lactoseFree: isLactoseFree,
            Filter.vegetarian: isVegetarian,
            Filter.vegan: isVegan
          });
          return false;
        },
        child: Column(
          children: [
            FilterSwitchTile(
              filterMap: widget.filter,
              switchFilter: isGlutenFree,
              title: "Gluten Free",
              subtitle: "This contains only gluten free meals",
              filter: Filter.glutenFree,
            ),
            FilterSwitchTile(
              filterMap: widget.filter,
              switchFilter: isLactoseFree,
              title: "Lactose Free",
              subtitle: "This contains only lactose free meals",
              filter: Filter.lactoseFree,
            ),
            FilterSwitchTile(
              filterMap: widget.filter,
              switchFilter: isVegetarian,
              title: "Vegetarian",
              subtitle: "This contains only vegetarian meals",
              filter: Filter.vegetarian,
            ),
            FilterSwitchTile(
              filterMap: widget.filter,
              switchFilter: isVegan,
              title: "Vegan",
              subtitle: "This contains only vegan meals",
              filter: Filter.vegan,
            ),
          ],
        ),
      ),
    );
  }
}
