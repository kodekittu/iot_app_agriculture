import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData buildThemeData() {
  return ThemeData(
      primaryColor: primaryColor,
      primaryColorDark: Colors.black54,
      primaryColorLight: primaryLight,
      accentColor: secondaryColor,
      textSelectionColor: primaryColor,
      brightness: Brightness.light,
//      iconTheme: IconThemeData(
//      color: Colors.lightBlueAccent,
//      opacity: 2.0
//  ),
     errorColor: Colors.red
      );
}
