import 'package:flutter/material.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './models/meal.dart';
import './screens/category_meal_screen.dart';

import './dummy_data.dart';
import './screens/filters_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((element) => element.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      //home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
            toggleFavorite: _toggleFavorite, isFavorite: _isMealFavorite),
      },
    );
  }
}
