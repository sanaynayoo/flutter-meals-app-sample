import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categorys,
    required this.onSelectCategory,
  });

  final CategoryModel categorys;
  final void Function() onSelectCategory;

  @override
  Widget build(context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: categorys.color.withOpacity(0.5),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              categorys.color.withOpacity(0.55),
              categorys.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(categorys.title),
      ),
    );
  }
}
