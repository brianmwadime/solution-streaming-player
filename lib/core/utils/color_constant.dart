import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color whiteA7007e = fromHex('#7effffff');

  static Color gray60075 = fromHex('#75707070');

  static Color whiteA700B4 = fromHex('#b4ffffff');

  static Color whiteA70099 = fromHex('#99ffffff');

  static Color whiteA70096 = fromHex('#96ffffff');

  static Color whiteA70097 = fromHex('#97ffffff');

  static Color greenA40069 = fromHex('#6902f387');

  static Color greenA40024 = fromHex('#2402f387');

  static Color deepOrange500 = fromHex('#f5562f');

  static Color greenA40066 = fromHex('#6602f387');

  static Color gray600 = fromHex('#707070');

  static Color tealA700 = fromHex('#13c78d');

  static Color whiteA7000a = fromHex('#0affffff');

  static Color gray800 = fromHex('#454545');

  static Color black9008d = fromHex('#8d060124');

  static Color whiteA7000f = fromHex('#0fffffff');

  static Color whiteA70061 = fromHex('#61ffffff');

  static Color gray200 = fromHex('#efefef');

  static Color gray30066 = fromHex('#66dddddd');

  static Color black9000d = fromHex('#0d000000');

  static Color bluegray401 = fromHex('#838092');

  static Color bluegray400 = fromHex('#888888');

  static Color whiteA70026 = fromHex('#26ffffff');

  static Color whiteA70024 = fromHex('#24ffffff');

  static Color whiteA700 = fromHex('#ffffff');

  static Color indigo600 = fromHex('#3a559f');

  static Color whiteA7001a = fromHex('#1affffff');

  static Color gray51 = fromHex('#fff6f5');

  static Color black9001a = fromHex('#1a000000');

  static Color greenA40040 = fromHex('#4002f387');

  static Color deepPurple700 = fromHex('#432fbc');

  static Color indigo3001a = fromHex('#1a7779b2');

  static Color gray50 = fromHex('#f9f9fd');

  static Color greenA400 = fromHex('#02f387');

  static Color whiteA70075 = fromHex('#75ffffff');

  static Color deepOrange50084 = fromHex('#84f5562f');

  static Color black900 = fromHex('#060124');

  static Color black902 = fromHex('#000000');

  static Color black901 = fromHex('#000000');

  static Color gray501 = fromHex('#aaaaaa');

  static Color whiteA700A1 = fromHex('#a1ffffff');

  static Color gray502 = fromHex('#9a9a9a');

  static Color gray500 = fromHex('#919191');

  static Color whiteA700A2 = fromHex('#a2ffffff');

  static Color gray900 = fromHex('#0f0f2d');

  static Color greenA40073 = fromHex('#7302f387');

  static Color whiteA70080 = fromHex('#80ffffff');

  static Color greenA4001a = fromHex('#1a02f387');

  static Color deepOrange5002e = fromHex('#2ef5562f');

  static Color tealA400 = fromHex('#3be6af');

  static Color whiteA70087 = fromHex('#87ffffff');

  static Color black90076 = fromHex('#76060124');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
