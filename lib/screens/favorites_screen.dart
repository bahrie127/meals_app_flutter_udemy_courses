import 'package:flutter/material.dart';
import 'package:meals_app_flutter_udemy_courses/widgets/meal_item.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Your have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meal: favoriteMeals[index]);
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
