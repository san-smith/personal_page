import 'package:flutter/material.dart';

class AppConfig {
  static const PRIMARY_COLOR = const Color(0xFF457b9d);
  static const SECONDARY_COLOR = const Color(0xFFa8dadc);
  static const ACCENT_COLOR = const Color(0xFFe63946);
  static const DARK_COLOR = const Color(0xFF1d3557);
  static const LIGHT_COLOR = const Color(0xFFf1faee);

  static ThemeData darkTheme = ThemeData(
    backgroundColor: PRIMARY_COLOR,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'JetBrainsMono',
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.white,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    cardColor: SECONDARY_COLOR,
  );
}
