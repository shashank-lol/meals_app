import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/provider/filters_provider.dart';
import 'package:meals_app/provider/fav_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;


  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals : filteredMeals,
    );
    var activePageTitle = "Categories";
    if (_selectedPageIndex == 1) {
      final favMeals = ref.watch(favMealsProvider);
      activePage = MealsScreen(
        meals: favMeals,
      );
      activePageTitle = "Your Favourites";
    }
    else if(_selectedPageIndex==2){
      activePage = const FiltersScreen();
      activePageTitle = "Filters";
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_alt), label: "Filters")
        ],
      ),
      body: activePage,
    );
  }
}
