import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/provider/filters_provider.dart';

class FilterSwitchTile extends ConsumerStatefulWidget {
  FilterSwitchTile(
      {super.key,
      required this.switchFilter,
      required this.title,
      required this.subtitle,
      required this.filter});

  final String title;
  final String subtitle;
  bool switchFilter;
  final Filter filter;

  @override
  ConsumerState<FilterSwitchTile> createState() => _FilterSwitchTileState();
}

class _FilterSwitchTileState extends ConsumerState<FilterSwitchTile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.switchFilter,
      onChanged: (isTrue) {
        setState(() {
          widget.switchFilter = isTrue;
          ref
              .read(filtersProvider.notifier)
              .setFilter(widget.filter, widget.switchFilter);
        });
      },
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground, fontSize: 20),
      ),
      subtitle: Text(
        widget.subtitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 32, right: 20),
    );
  }
}
