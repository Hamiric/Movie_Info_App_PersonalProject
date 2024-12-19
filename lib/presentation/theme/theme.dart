import 'package:flutter/material.dart';
import 'package:movie_info_app_personalproject/presentation/theme/appthemeextension.dart';

class LightTheme extends AppThemeExtension {
  const LightTheme(
      {super.main = Colors.red,
      super.mainLight = const Color(0xAAFF0000),
      super.sub = const Color(0xFFFFF000),
      super.background = Colors.white});
}

class DarkTheme extends AppThemeExtension {
  const DarkTheme({
    super.main = const Color(0xfff2f2f2),
    super.mainLight = Colors.white,
    super.sub = const Color(0xFF064973),
    super.background = const Color(0xff141318),
  });
}


final lightTheme = _theme(Brightness.light, const LightTheme());
final darkTheme = _theme(Brightness.dark, const DarkTheme());

ThemeData _theme(Brightness brightness, AppThemeExtension ext) {
  return ThemeData(
    brightness: brightness,
    useMaterial3: true,
    scaffoldBackgroundColor: ext.background,
    colorScheme:
        ColorScheme.fromSeed(brightness: brightness, seedColor: ext.main),
    extensions: [ext],
  );
}


extension BuildContextThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppThemeExtension get appColor => theme.extension<AppThemeExtension>()!;
}
