import 'package:flutter/material.dart';

class ToriiColors {
  static const MaterialColor transparent = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0x00000000),
      100: const Color(0x00000000),
      200: const Color(0x00000000),
      300: const Color(0x00000000),
      400: const Color(0x00000000),
      500: const Color(0x00000000),
      600: const Color(0x00000000),
      700: const Color(0x00000000),
      800: const Color(0x00000000),
      900: const Color(0x00000000),
    },
  );

  static const Gradient backgroundGradient = LinearGradient(colors: [
    Color.fromRGBO(24, 118, 210, 1),
    Color.fromRGBO(42, 203, 232, 1)
  ]);
}
