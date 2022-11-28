import 'package:flutter/material.dart';
import 'package:nft_showcase/theme/app_theme.dart';
import 'package:nft_showcase/theme/themes.dart';

AppTheme appTheme = AppTheme();

Themes customColors(BuildContext context) {
  return Theme.of(context).extension<Themes>()!;
}
