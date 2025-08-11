import 'package:flutter/material.dart';

class AppColors {
  static Color primary = Colors.blue;
  static Color secondary = Colors.blue.shade50;
  static Color white = Colors.white;
  static Color black = Colors.black;
  static const warning = Color(0xFFF88F2D);
  static const warningLight = Color(0xFFFFF6EE);

  static List<BoxShadow>? boxShadow = [
    BoxShadow(
      color: black.withOpacity(.05),
      blurRadius: 10,
      offset: const Offset(0, 2),
    ),
  ];
}
