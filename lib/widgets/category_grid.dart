import 'package:flutter/material.dart';
import 'package:mealss_app/model/category.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key, required this.category,required this.onselectcategory});

  final Category category;
  final void Function() onselectcategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselectcategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            textAlign: TextAlign.center,
          )),
    );
  }
}
