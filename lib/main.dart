import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
//import 'package:mealss_app/data/dummy_data.dart';
import 'package:mealss_app/screens/categories_screen.dart';

//import 'package:mealss_app/screens/meals.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 195, 141, 101),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const CategoriesScreen());
  }
}
