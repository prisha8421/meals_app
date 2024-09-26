git giimport 'package:flutter/material.dart';
import 'package:mealss_app/data/dummy_data.dart';
import 'package:mealss_app/model/category.dart';
import 'package:mealss_app/model/meal.dart';
import 'package:mealss_app/screens/meals.dart';
import 'package:mealss_app/widgets/drawer.dart';
import 'package:mealss_app/widgets/category_grid.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool _isVegetarian = false; // Track vegetarian filter state

  void _selectCategory(BuildContext context, Category cat) {
    final List<Meal> filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(cat.id))
        .where((meal) => !_isVegetarian || meal.isVegetarian)
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: cat.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  void _onSelectScreen(String identifier) {
    if (identifier == 'meals') {
      Navigator.of(context).pop(); // Close the drawer
    } else if (identifier == 'filters') {
      // Handle filters
      Navigator.of(context).pop();
    }
  }

  void _onToggleVegetarian(bool value) {
    setState(() {
      _isVegetarian = value; // Update vegetarian filter state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick Your Category"),
      ),
      drawer: MainDrawer(
        isVegetarian: _isVegetarian, // Pass the vegetarian state
        onSelectScreen: _onSelectScreen,
        onToggleVegetarian: _onToggleVegetarian, // Pass toggle handler
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(10), // Padding around the grid
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: availableCategories.length,
          itemBuilder: (ctx, index) {
            final cat = availableCategories[index];
            return ClipRRect(
              borderRadius:
                  BorderRadius.circular(15), // Rounded borders for grid items
              child: CategoryGrid(
                category: cat,
                onselectcategory: () {
                  _selectCategory(context, cat);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
