import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({
    super.key,
    required this.meal,
    required this.onFavoriteMeal,
  });

  final Meal meal;
  final void Function(Meal meal) onFavoriteMeal;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              onFavoriteMeal(meal);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 230,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Ingredient',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            for (var ingredient in meal.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  ingredient,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Steps',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                  fontSize: 20,
                ),
              ),
            ),
            for (var step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  step,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
