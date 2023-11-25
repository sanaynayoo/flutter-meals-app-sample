import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail.dart';
import 'package:meals_app/widgets/meal_item.dart';

class Meals extends StatelessWidget {
  const Meals({
    super.key,
    this.title,
    required this.meals,
    required this.onFavoriteMeal,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onFavoriteMeal;

  void _selectedMeal(BuildContext context, meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetail(
          meal: meal,
          onFavoriteMeal: onFavoriteMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Oh no! .. is nothing here!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.purple,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Try to select another meals category',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectedMeal: () {
            _selectedMeal(context, meals[index]);
          },
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: content,
    );
  }
}
