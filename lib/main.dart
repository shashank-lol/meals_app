import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/models/theme.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/data/meal_data.dart';
import 'package:meals_app/screens/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      home: const TabsScreen(),
    );
  }
}
