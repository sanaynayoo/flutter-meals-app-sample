import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_item.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.onFavoriteMeal,
  });

  final void Function(Meal meal) onFavoriteMeal;

  void _onSelectedCategory(BuildContext context, CategoryModel category) {
    final filterCategory = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Meals(
          title: category.title,
          meals: filterCategory,
          onFavoriteMeal: onFavoriteMeal,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (var category in availableCategories)
          CategoryItem(
            categorys: category,
            onSelectCategory: () {
              _onSelectedCategory(
                context,
                category,
              );
            },
          )
      ],
    );
  }
}
