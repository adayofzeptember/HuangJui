import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor thisRed = MaterialColor(
    0xFF840202,
    <int, Color>{
      50: Color(0xffce5641), //10%
      100: Color(0xffb74c3a), //20%
      200: Color(0xffa04332), //30%
      300: Color(0xff89392b), //40%
      400: Color(0xff733024), //50%
      500: Color(0xff5c261d), //60%
      600: Color(0xff451c16), //70%
      700: Color(0xff2e130e), //80%
      800: Color(0xff170907), //90%
      900: Color(0xff000000), //100%
    },
  );
} //

Map<int, Color> color = {
  50: const Color(0xffce5641), //10%
  100: const Color(0xffb74c3a), //20%
  200: const Color(0xffa04332), //30%
  300: const Color(0xff89392b), //40%
  400: const Color(0xff733024), //50%
  500: const Color(0xff5c261d), //60%
  600: const Color(0xff451c16), //70%
  700: const Color(0xff2e130e), //80%
  800: const Color(0xff170907), //90%
  900: const Color(0xff000000), //100%
};

MaterialColor theRed = MaterialColor(0xFF840202, color);
