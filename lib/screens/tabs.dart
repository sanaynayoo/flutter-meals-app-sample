import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  var activePageIndex = 0;
  final List<Meal> _mealFavorites = [];

  void onChangeTabs(int index) {
    setState(() {
      activePageIndex = index;
    });
  }

  void onAddFavoriteMeal(Meal meal) {
    var isExisting = _mealFavorites.contains(meal);
    if (isExisting) {
      _mealFavorites.remove(meal);
    } else {
      _mealFavorites.add(meal);
    }
  }

  @override
  Widget build(context) {
    Widget activePage = Categories(
      onFavoriteMeal: onAddFavoriteMeal,
    );
    var activePageTitle = 'Categories';

    if (activePageIndex == 1) {
      activePage = Meals(
        meals: _mealFavorites,
        onFavoriteMeal: onAddFavoriteMeal,
      );
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onChangeTabs,
        currentIndex: activePageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
