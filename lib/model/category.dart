import 'package:flutter/material.dart';

class Category {
  Category({required this.id,required this.title, this.color = Colors.pink});

  final String title;
  final String id;
  final Color color;
}
