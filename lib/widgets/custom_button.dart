import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.onTap,
      this.width,
      this.margin,
      this.prefixWidget,
      this.suffixWidget,
      this.text});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  VoidCallback? onTap;

  double? width;

  EdgeInsetsGeometry? margin;

  Widget? prefixWidget;

  Widget? suffixWidget;

  String? text;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 0,
        margin: margin,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixWidget ?? SizedBox(),
            Text(
              text ?? "",
              textAlign: TextAlign.center,
              style: _setFontStyle(),
            ),
            suffixWidget ?? SizedBox(),
          ],
        ),
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll6:
        return EdgeInsets.all(
          6,
        );
      case ButtonPadding.PaddingAll11:
        return EdgeInsets.all(
          11,
        );
      default:
        return EdgeInsets.all(
          20,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.OutlineGreenA40040:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineGreenA40040_1:
        return ColorConstant.tealA400;
      case ButtonVariant.FillWhiteA7000a:
        return ColorConstant.whiteA7000a;
      case ButtonVariant.FillWhiteA7000f:
        return ColorConstant.whiteA7000f;
      case ButtonVariant.FillDeeporange500:
        return ColorConstant.deepOrange500;
      case ButtonVariant.OutlineTealA400:
      case ButtonVariant.OutlineGray600:
      case ButtonVariant.OutlineBluegray401:
        return null;
      default:
        return ColorConstant.tealA400;
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.OutlineTealA400:
        return Border.all(
          color: ColorConstant.tealA400,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineGray600:
        return Border.all(
          color: ColorConstant.gray600,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineBluegray401:
        return Border.all(
          color: ColorConstant.bluegray401,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.FillTealA400:
      case ButtonVariant.OutlineGreenA40040:
      case ButtonVariant.OutlineGreenA40040_1:
      case ButtonVariant.FillWhiteA7000a:
      case ButtonVariant.FillWhiteA7000f:
      case ButtonVariant.FillDeeporange500:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder10:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
      case ButtonShape.RoundedBorder2:
        return BorderRadius.circular(
          getHorizontalSize(
            2.00,
          ),
        );
      case ButtonShape.RoundedBorder22:
        return BorderRadius.circular(
          getHorizontalSize(
            22.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            29.00,
          ),
        );
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case ButtonVariant.OutlineGreenA40040:
        return [
          BoxShadow(
            color: ColorConstant.greenA40040,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              8,
            ),
          )
        ];
      case ButtonVariant.OutlineTealA400:
        return [
          BoxShadow(
            color: ColorConstant.greenA40040,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              8,
            ),
          )
        ];
      case ButtonVariant.OutlineGreenA40040_1:
        return [
          BoxShadow(
            color: ColorConstant.greenA40040,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              8,
            ),
          )
        ];
      case ButtonVariant.OutlineGray600:
        return [
          BoxShadow(
            color: ColorConstant.greenA40040,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              8,
            ),
          )
        ];
      case ButtonVariant.FillTealA400:
      case ButtonVariant.FillWhiteA7000a:
      case ButtonVariant.FillWhiteA7000f:
      case ButtonVariant.FillDeeporange500:
      case ButtonVariant.OutlineBluegray401:
        return null;
      default:
        return null;
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.PoppinsMedium14WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium14WhiteA70099:
        return TextStyle(
          color: ColorConstant.whiteA70099,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium13:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: 13,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsSemiBold12:
        return TextStyle(
          color: ColorConstant.whiteA700A2,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.PoppinsMedium12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium20:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: 20,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium14Bluegray401:
        return TextStyle(
          color: ColorConstant.bluegray401,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      default:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
    }
  }
}

enum ButtonShape {
  Square,
  CircleBorder29,
  RoundedBorder10,
  RoundedBorder2,
  RoundedBorder22,
}

enum ButtonPadding {
  PaddingAll22,
  PaddingAll11,
  PaddingAll6,
  PaddingAll16,
  PaddingAll19,
}

enum ButtonVariant {
  FillTealA400,
  OutlineGreenA40040,
  OutlineTealA400,
  OutlineGreenA40040_1,
  OutlineGray600,
  FillWhiteA7000a,
  FillWhiteA7000f,
  FillDeeporange500,
  OutlineBluegray401,
}

enum ButtonFontStyle {
  PoppinsMedium14,
  PoppinsMedium14WhiteA700,
  PoppinsMedium14WhiteA70099,
  PoppinsMedium13,
  PoppinsSemiBold12,
  PoppinsMedium12,
  PoppinsMedium20,
  PoppinsMedium14Bluegray401,
}
