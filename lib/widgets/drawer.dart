import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final bool isVegetarian;
  final void Function(String identifier) onSelectScreen;
  final void Function(bool value) onToggleVegetarian; // Added toggle callback

  const MainDrawer({
    super.key,
    required this.onSelectScreen,
    required this.isVegetarian,
    required this.onToggleVegetarian, // Required for toggle handling
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
              ]),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Text("Cooking Up!",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        )),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.filter_alt,
              size: 26,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text("Vegetarian Only"),
            value: isVegetarian,
            onChanged: (value) {
              onToggleVegetarian(value); // Handle toggle
            },
            secondary: Icon(
              isVegetarian ? Icons.check_box : Icons.check_box_outline_blank,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
