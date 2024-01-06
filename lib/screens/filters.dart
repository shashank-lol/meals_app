import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/widgets/switch_filter_tile.dart';
import 'package:meals_app/provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: Column(
        children: [
          FilterSwitchTile(
            switchFilter: activeFilters[Filter.glutenFree]!,
            title: "Gluten Free",
            subtitle: "This contains only gluten free meals",
            filter: Filter.glutenFree,
          ),
          FilterSwitchTile(
            switchFilter: activeFilters[Filter.lactoseFree]!,
            title: "Lactose Free",
            subtitle: "This contains only lactose free meals",
            filter: Filter.lactoseFree,
          ),
          FilterSwitchTile(
            switchFilter: activeFilters[Filter.vegetarian]!,
            title: "Vegetarian",
            subtitle: "This contains only vegetarian meals",
            filter: Filter.vegetarian,
          ),
          FilterSwitchTile(
            switchFilter: activeFilters[Filter.vegan]!,
            title: "Vegan",
            subtitle: "This contains only vegan meals",
            filter: Filter.vegan,
          ),
        ],
      ),
    );
  }
}
