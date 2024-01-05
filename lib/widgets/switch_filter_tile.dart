import 'package:flutter/material.dart';

import 'package:meals_app/screens/filters.dart';

class FilterSwitchTile extends StatefulWidget {
  FilterSwitchTile(
      {super.key,
      required this.switchFilter,
      required this.title,
      required this.subtitle,
      required this.filterMap,
      required this.filter});

  final String title;
  final String subtitle;
  bool switchFilter;
  final Map<Filter,bool> filterMap;
  final Filter filter;

  @override
  State<FilterSwitchTile> createState() => _FilterSwitchTileState();
}

class _FilterSwitchTileState extends State<FilterSwitchTile> {

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.switchFilter,
      onChanged: (isTrue) {
        setState(() {
          widget.switchFilter = isTrue;
          widget.filterMap[widget.filter] = isTrue;
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
