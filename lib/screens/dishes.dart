import 'package:flutter/material.dart';

import 'package:meals_app/models/meal.dart';

class DishScreen extends StatelessWidget {
  const DishScreen({super.key, required this.meal, required this.onToggleFavourite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){onToggleFavourite(meal);}, icon: Icon(Icons.star_outline)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: ListView(
          children: [
            Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Instructions",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  step,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
          ],
        ),
      ),
    );
  }
}
