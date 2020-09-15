import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_mobile/components/dynamic_theme_mode.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pokedex_mobile/routes.dart';
import 'package:pokedex_mobile/themes.dart';
import 'package:utopic_toast/utopic_toast.dart';

main() async {
  await initialization();
  runApp(PokedexApp());
}

Future<void> initialization() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsBinding.instance.renderView.automaticSystemUiAdjustment = false;
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
}

class PokedexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicThemeMode(
      builder: (context, themeMode) {
        return MaterialApp(
          title: 'Pokedex - flying pokemons',
          supportedLocales: [
            Locale('en', ''),
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          builder: (context, child) {
            if (Theme.of(context).brightness == Brightness.dark) {
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.light,
                  systemNavigationBarDividerColor: Colors.white,
                  systemNavigationBarColor:
                      Theme.of(context).scaffoldBackgroundColor,
                  systemNavigationBarIconBrightness: Brightness.light,
                ),
              );
            } else {
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.dark,
                  systemNavigationBarDividerColor: Colors.black,
                  systemNavigationBarColor: Theme.of(context).cardColor,
                  systemNavigationBarIconBrightness: Brightness.dark,
                ),
              );
            }
            return ToastOverlay(
              child: child,
            );
          },
          themeMode: themeMode,
          theme: kPokedexLightTheme,
          darkTheme: kPokedexDarkTheme,
          onGenerateRoute: onGenerateRoute,
        );
      },
    );
  }
}