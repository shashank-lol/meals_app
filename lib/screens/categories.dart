import 'package:flutter/material.dart';
import 'package:meals_app/data/meal_data.dart';
import 'package:meals_app/models/theme.dart';

import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals, required this.onToggleFavourite});

  final void Function(Meal meal) onToggleFavourite;
  final List<Meal>availableMeals;

  void _selectCategory(Category category,BuildContext context) {
    final filteredList = availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredList, onToggleFavourite: onToggleFavourite,)));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(category, context);
              },
            ),
        ],
    );
  }
}
