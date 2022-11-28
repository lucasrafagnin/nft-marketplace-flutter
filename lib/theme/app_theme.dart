import 'package:flutter/material.dart';

class AppTheme {
  final ValueNotifier<ThemeMode> current = ValueNotifier(ThemeMode.light);

  void switchTheme() {
    current.value = current.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
