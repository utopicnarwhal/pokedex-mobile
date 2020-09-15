import 'package:flutter/material.dart';
import 'package:pokedex_mobile/components/dynamic_theme_mode.dart';

class ChangeThemeButton extends StatefulWidget {
  @override
  _ChangeThemeButtonState createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends State<ChangeThemeButton> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ThemeMode>(
      future: DynamicThemeMode.of(context).loadThemeMode(),
      builder: (context, themeModeSnapshot) {
        if (!themeModeSnapshot.hasData) return Container();

        IconData icon;

        switch (themeModeSnapshot.data) {
          case ThemeMode.system:
            icon = Icons.brightness_auto;
            break;
          case ThemeMode.light:
            icon = Icons.brightness_high;
            break;
          case ThemeMode.dark:
            icon = Icons.brightness_low;
            break;
          default:
            icon = Icons.brightness_auto;
            break;
        }

        return IconButton(
          icon: Icon(icon),
          onPressed: () {
            switch (themeModeSnapshot.data) {
              case ThemeMode.system:
                DynamicThemeMode.of(context).setThemeMode(ThemeMode.light);
                break;
              case ThemeMode.light:
                DynamicThemeMode.of(context).setThemeMode(ThemeMode.dark);
                break;
              case ThemeMode.dark:
                DynamicThemeMode.of(context).setThemeMode(ThemeMode.system);
                break;
              default:
                DynamicThemeMode.of(context).setThemeMode(ThemeMode.light);
                break;
            }
          },
        );
      },
    );
  }
}
