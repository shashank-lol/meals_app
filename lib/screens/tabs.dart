import 'package:flutter/material.dart';
import 'package:meals_app/data/meal_data.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];
  final Map<Filter,bool> filters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false
  };

  void _showFavouriteMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavouriteStatus(Meal meal) {
    bool isFavourite = _favouriteMeals.contains(meal);
    if (isFavourite) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      _showFavouriteMessage("Meal is removed from Favourites");
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
      _showFavouriteMessage("Meal is added to Favourites");
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = dummyMeals.where((meal){
      if(filters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(filters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(filters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(filters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      availableMeals : filteredMeals,
      onToggleFavourite: _toggleMealFavouriteStatus,
    );
    var activePageTitle = "Categories";
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavourite: _toggleMealFavouriteStatus,
      );
      activePageTitle = "Your Favourites";
    }
    else if(_selectedPageIndex==2){
      activePage = FiltersScreen(filters);
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
