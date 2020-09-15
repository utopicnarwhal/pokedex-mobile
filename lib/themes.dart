import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const MaterialColor kPokedexCeruleanBlueColor = MaterialColor(0xff3b4cca, const {
  50: const Color(0xffe8eaf9),
  100: const Color(0xffc6c9f0),
  200: const Color(0xff9fa6e5),
  300: const Color(0xff7883db),
  400: const Color(0xff5a67d3),
  500: const Color(0xff3b4cca),
  600: const Color(0xff3543bf),
  700: const Color(0xff2c39b3),
  800: const Color(0xff232ea8),
  900: const Color(0xff101994),
});

const MaterialColor kPokedexGoldenYellowColor = MaterialColor(0xffffdd00, const {
  50: const Color(0xfffffee6),
  100: const Color(0xfffffac0),
  200: const Color(0xfffef695),
  300: const Color(0xfffcf267),
  400: const Color(0xfff9ee3e),
  500: const Color(0xfff6e900),
  600: const Color(0xffffdd00),
  700: const Color(0xffffc400),
  800: const Color(0xffffab00),
  900: const Color(0xffff7e00),
});

/// 10
const double kCardBorderRadius = 10;

/// 10
const double kPopupMenuBorderRadius = 10;

/// 18
const double kBottomSheetBorderRadius = 18;

const kErrorColor = Color(0xFFD70C17);

const _kSecondaryColorLightTheme = Color(0xFF334E7B);
const _kSecondaryColorDarkTheme = Color(0xFF4A7FD7);
Color kSecondaryColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return _kSecondaryColorLightTheme;
  }
  return _kSecondaryColorDarkTheme;
}

const _kLightThemeDisabledFieldTextColor = Color(0xFF777777);
const _kDarkThemeDisabledFieldTextColor = Color(0xFFDDDDDD);
Color kDisabledFieldTextColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return _kLightThemeDisabledFieldTextColor;
  }
  return _kDarkThemeDisabledFieldTextColor;
}

const _kLightThemeDividerColor = Color(0xFFDDDDDD);
const _kDarkThemeDividerColor = Color(0xFF888888);

const kDefaultFieldBorderWidth = 1.0;
const kActiveFieldBorderWidth = 4.0;
const kFieldBorderRadius = 4.0;

final _inputDecorationLightTheme = InputDecorationTheme(
  fillColor: Color(0xFFEEEEEE),
);

final _inputDecorationDarkTheme = InputDecorationTheme(
  fillColor: Color(0xFF666666),
);

final _buttonTheme = ButtonThemeData(
  textTheme: ButtonTextTheme.primary,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5.0),
  ),
);

final _cardTheme = CardTheme(
  margin: EdgeInsets.zero,
  elevation: 4,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(kCardBorderRadius),
  ),
);

final _dialogTheme = DialogTheme(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(kPopupMenuBorderRadius),
  ),
);

final _dividerTheme = DividerThemeData(space: 1, thickness: 0.5);

final _snackBarTheme = SnackBarThemeData(behavior: SnackBarBehavior.fixed);

final _popupMenuTheme = PopupMenuThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(kPopupMenuBorderRadius),
  ),
);

final _bottomSheetTheme = BottomSheetThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(kBottomSheetBorderRadius),
    ),
  ),
);

final _buttonBarTheme = ButtonBarThemeData();

final ThemeData kPokedexLightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: kPokedexCeruleanBlueColor,
  fontFamily: 'Inter',
  inputDecorationTheme: _inputDecorationLightTheme,
  buttonTheme: _buttonTheme,
  cardTheme: _cardTheme,
  dialogTheme: _dialogTheme,
  scaffoldBackgroundColor: Color(0xFFF8F8F8),
  dividerColor: _kLightThemeDividerColor,
  dividerTheme: _dividerTheme,
  snackBarTheme: _snackBarTheme,
  popupMenuTheme: _popupMenuTheme,
  bottomSheetTheme: _bottomSheetTheme,
  buttonBarTheme: _buttonBarTheme,
  cupertinoOverrideTheme: CupertinoThemeData(
    primaryColor: CupertinoColors.systemBlue,
    brightness: Brightness.light,
  ),
);

final ThemeData kPokedexDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: kPokedexGoldenYellowColor,
  fontFamily: 'Inter',
  primaryColorDark: kPokedexGoldenYellowColor,
  iconTheme: IconThemeData(color: Color(0xFFDDDDDD)),
  accentColor: kPokedexGoldenYellowColor,
  toggleableActiveColor: kPokedexGoldenYellowColor,
  inputDecorationTheme: _inputDecorationDarkTheme,
  buttonTheme: _buttonTheme,
  cardTheme: _cardTheme,
  dialogTheme: _dialogTheme,
  dividerColor: _kDarkThemeDividerColor,
  dividerTheme: _dividerTheme,
  snackBarTheme: _snackBarTheme,
  popupMenuTheme: _popupMenuTheme,
  bottomSheetTheme: _bottomSheetTheme,
  buttonBarTheme: _buttonBarTheme,
  cupertinoOverrideTheme: CupertinoThemeData(
    primaryColor: CupertinoColors.systemBlue,
    brightness: Brightness.dark,
  ),
);
