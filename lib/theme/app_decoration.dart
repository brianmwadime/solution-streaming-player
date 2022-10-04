import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get txtFillGray501 => BoxDecoration(
        color: ColorConstant.gray501,
      );
  static BoxDecoration get fillBlack9008d => BoxDecoration(
        color: ColorConstant.black9008d,
      );
  static BoxDecoration get fillDeeppurple700 => BoxDecoration(
        color: ColorConstant.deepPurple700,
      );
  static BoxDecoration get txtFillTealA400 => BoxDecoration(
        color: ColorConstant.tealA400,
      );
  static BoxDecoration get fillBlack900 => BoxDecoration(
        color: ColorConstant.black900,
      );
  static BoxDecoration get outlineBlack9000d => BoxDecoration(
        color: ColorConstant.black90076,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9000d,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(
              0,
              20,
            ),
          ),
        ],
      );
  static BoxDecoration get fillTealA400 => BoxDecoration(
        color: ColorConstant.tealA400,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder7 = BorderRadius.circular(
    getHorizontalSize(
      7.00,
    ),
  );

  static BorderRadius roundedBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12.00,
    ),
  );

  static BorderRadius roundedBorder4 = BorderRadius.circular(
    getHorizontalSize(
      4.00,
    ),
  );

  static BorderRadius txtRoundedBorder5 = BorderRadius.circular(
    getHorizontalSize(
      5.00,
    ),
  );

  static BorderRadius roundedBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20.00,
    ),
  );

  static BorderRadius txtRoundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8.00,
    ),
  );

  static BorderRadius roundedBorder29 = BorderRadius.circular(
    getHorizontalSize(
      29.00,
    ),
  );

  static BorderRadius circleBorder39 = BorderRadius.circular(
    getHorizontalSize(
      39.00,
    ),
  );
}
