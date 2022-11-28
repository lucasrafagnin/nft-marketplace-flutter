import 'package:flutter/material.dart';

@immutable
class Themes extends ThemeExtension<Themes> {
  final Color? background;
  final Color? primaryText;
  final Color? secondaryText;
  final Color? primaryContrastText;
  final Color? secondaryContrastText;
  final Color? bottomNavigationBackground;
  final Color? bottomNavigationSelected;
  final Color? bottomNavigationUnselected;
  final Color? marketPositive;
  final Color? marketNegative;
  final Color? chipSelected;
  final Color? chipUnselected;

  const Themes(
      {required this.background,
      required this.primaryText,
      required this.secondaryText,
      required this.primaryContrastText,
      required this.secondaryContrastText,
      required this.bottomNavigationBackground,
      required this.bottomNavigationSelected,
      required this.bottomNavigationUnselected,
      required this.marketPositive,
      required this.marketNegative,
      required this.chipSelected,
      required this.chipUnselected});

  @override
  Themes copyWith({
    Color? background,
    Color? primaryText,
    Color? secondaryText,
    Color? primaryContrastText,
    Color? secondaryContrastText,
    Color? bottomNavigationBackground,
    Color? bottomNavigationSelected,
    Color? bottomNavigationUnselected,
    Color? marketPositive,
    Color? marketNegative,
    Color? chipSelected,
    Color? chipUnselected,
  }) {
    return Themes(
      background: background ?? this.background,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      primaryContrastText: primaryContrastText ?? this.primaryContrastText,
      secondaryContrastText:
          secondaryContrastText ?? this.secondaryContrastText,
      bottomNavigationBackground:
          bottomNavigationBackground ?? this.bottomNavigationBackground,
      bottomNavigationSelected:
          bottomNavigationSelected ?? this.bottomNavigationSelected,
      bottomNavigationUnselected:
          bottomNavigationUnselected ?? this.bottomNavigationUnselected,
      marketPositive: marketPositive ?? this.marketPositive,
      marketNegative: marketNegative ?? this.marketNegative,
      chipSelected: chipSelected ?? this.chipSelected,
      chipUnselected: chipUnselected ?? this.chipUnselected,
    );
  }

  @override
  Themes lerp(ThemeExtension<Themes>? other, double t) {
    if (other is! Themes) {
      return this;
    }
    return Themes(
      background: Color.lerp(background, other.background, t),
      primaryText: Color.lerp(primaryText, other.primaryText, t),
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t),
      primaryContrastText:
          Color.lerp(primaryContrastText, other.primaryContrastText, t),
      secondaryContrastText:
          Color.lerp(secondaryContrastText, other.secondaryContrastText, t),
      bottomNavigationBackground: Color.lerp(
          bottomNavigationBackground, other.bottomNavigationBackground, t),
      bottomNavigationSelected: Color.lerp(
          bottomNavigationSelected, other.bottomNavigationSelected, t),
      bottomNavigationUnselected: Color.lerp(
          bottomNavigationUnselected, other.bottomNavigationUnselected, t),
      marketPositive: Color.lerp(marketPositive, other.marketPositive, t),
      marketNegative: Color.lerp(marketNegative, other.marketNegative, t),
      chipSelected: Color.lerp(chipSelected, other.chipSelected, t),
      chipUnselected: Color.lerp(chipUnselected, other.chipUnselected, t),
    );
  }

  static const light = Themes(
    background: Color(0xFFFFFFFF),
    primaryText: Color(0xFF000000),
    secondaryText: Color(0xDD000000),
    primaryContrastText: Color(0xFFFFFFFF),
    secondaryContrastText: Color(0x99FFFFFF),
    bottomNavigationBackground: Color(0xFF172645),
    bottomNavigationSelected: Color(0xFFFFFFFF),
    bottomNavigationUnselected: Color(0xFF9E9E9E),
    marketPositive: Color(0xFF4CAF50),
    marketNegative: Color(0xFFF44336),
    chipSelected: Color(0xFFFFFFFF),
    chipUnselected: Color(0xDD000000),
  );

  static const dark = Themes(
    background: Color(0xFF010713),
    primaryText: Color(0xFFFFFFFF),
    secondaryText: Color(0x99FFFFFF),
    primaryContrastText: Color(0xFF000000),
    secondaryContrastText: Color(0xDD000000),
    bottomNavigationBackground: Color(0xFF172645),
    bottomNavigationSelected: Color(0xFFFFFFFF),
    bottomNavigationUnselected: Color(0xFF9E9E9E),
    marketPositive: Color(0xFF90E893),
    marketNegative: Color(0xFFFD6963),
    chipSelected: Color(0xFFFFFFFF),
    chipUnselected: Color(0xFF172645),
  );
}
