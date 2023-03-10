import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;

  ThemeProvider(BuildContext context);
  bool get isDarkMode => themeMode == ThemeMode.dark;
}

class MyThemes{
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      colorScheme: const ColorScheme.dark(),
      iconTheme:  IconThemeData(
        color: Colors.purple.shade200,
      )
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(
        color: Colors.red, opacity: 0.8),
  );
}