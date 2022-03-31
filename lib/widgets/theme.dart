import 'package:flutter/material.dart';

ThemeData? basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
        //copywith é como um override
        headline1: base.headline1!.copyWith(
      fontFamily: "MerriWeather",
      fontSize: 22,
      color: Colors.black,
    ));
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: Colors.white,
    splashColor: Colors.red,
  );
}
