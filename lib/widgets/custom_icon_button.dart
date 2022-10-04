import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.padding,
      this.shape,
      this.variant,
      this.alignment,
      this.margin,
      this.height,
      this.width,
      this.child,
      this.onTap});

  final IconButtonPadding? padding;

  final IconButtonShape? shape;

  final IconButtonVariant? variant;

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final double? height;

  final double? width;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        constraints: BoxConstraints(
          minHeight: height ?? 0,
          minWidth: width ?? 0,
        ),
        padding: EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: height ?? 0,
          height: width ?? 0,
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
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
      case IconButtonPadding.PaddingAll5:
        return EdgeInsets.all(5);
      case IconButtonPadding.PaddingAll1:
        return EdgeInsets.all(1);
      case IconButtonPadding.PaddingAll10:
        return EdgeInsets.all(10);
      case IconButtonPadding.PaddingAll16:
        return EdgeInsets.all(16);
      case IconButtonPadding.none:
        return EdgeInsets.all(0);
      default:
        return EdgeInsets.all(13);
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.FillIndigo600:
        return ColorConstant.indigo600;
      case IconButtonVariant.OutlineWhiteA700:
        return ColorConstant.black900;
      case IconButtonVariant.OutlineBlack9001a:
        return ColorConstant.whiteA70061;
      case IconButtonVariant.FillTealA400:
        return ColorConstant.tealA400;
      case IconButtonVariant.OutlineGreenA40024_1:
        return ColorConstant.greenA400;
      case IconButtonVariant.FillWhiteA70026:
        return ColorConstant.whiteA70026;
      case IconButtonVariant.OutlineGreenA4001a:
        return ColorConstant.tealA400;
      case IconButtonVariant.OutlineGreenA40024_2:
        return ColorConstant.deepOrange500;
      case IconButtonVariant.FillWhiteA700:
        return ColorConstant.whiteA700;
      case IconButtonVariant.FillGray51:
        return ColorConstant.gray51;
      case IconButtonVariant.OutlineDeeporange5002e:
        return ColorConstant.tealA400;
      case IconButtonVariant.FillTealA700:
        return ColorConstant.tealA700;
      case IconButtonVariant.none:
        return Colors.transparent;
      default:
        return ColorConstant.tealA400;
    }
  }

  _setBorder() {
    switch (variant) {
      case IconButtonVariant.OutlineWhiteA700:
        return Border.all(
          color: ColorConstant.whiteA700,
          width: 2.00,
        );
      case IconButtonVariant.OutlineGreenA40024:
      case IconButtonVariant.FillIndigo600:
      case IconButtonVariant.OutlineBlack9001a:
      case IconButtonVariant.FillTealA400:
      case IconButtonVariant.OutlineGreenA40024_1:
      case IconButtonVariant.FillWhiteA70026:
      case IconButtonVariant.OutlineGreenA4001a:
      case IconButtonVariant.OutlineGreenA40024_2:
      case IconButtonVariant.FillWhiteA700:
      case IconButtonVariant.FillGray51:
      case IconButtonVariant.OutlineDeeporange5002e:
      case IconButtonVariant.FillTealA700:
      case IconButtonVariant.none:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.RoundedBorder13:
        return BorderRadius.circular(
          13,
        );
      case IconButtonShape.CircleBorder7:
        return BorderRadius.circular(
          7,
        );
      case IconButtonShape.CircleBorder25:
        return BorderRadius.circular(
          25,
        );
      case IconButtonShape.RoundedBorder18:
        return BorderRadius.circular(
          18,
        );
      case IconButtonShape.CircleBorder35:
        return BorderRadius.circular(
          35,
        );
      case IconButtonShape.none:
        return BorderRadius.circular(
          0,
        );
      default:
        return BorderRadius.circular(
          22,
        );
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case IconButtonVariant.OutlineBlack9001a:
        return [
          BoxShadow(
            color: ColorConstant.black9001a,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(
              0,
              4,
            ),
          )
        ];
      case IconButtonVariant.OutlineGreenA40024_1:
        return [
          BoxShadow(
            color: ColorConstant.greenA40024,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(
              0,
              4,
            ),
          )
        ];
      case IconButtonVariant.OutlineGreenA4001a:
        return [
          BoxShadow(
            color: ColorConstant.greenA4001a,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(
              0,
              4,
            ),
          )
        ];
      case IconButtonVariant.OutlineGreenA40024_2:
        return [
          BoxShadow(
            color: ColorConstant.greenA40024,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(
              0,
              4,
            ),
          )
        ];
      case IconButtonVariant.OutlineDeeporange5002e:
        return [
          BoxShadow(
            color: ColorConstant.deepOrange5002e,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(
              0,
              4,
            ),
          )
        ];
      case IconButtonVariant.FillIndigo600:
      case IconButtonVariant.OutlineWhiteA700:
      case IconButtonVariant.FillTealA400:
      case IconButtonVariant.FillWhiteA70026:
      case IconButtonVariant.FillWhiteA700:
      case IconButtonVariant.FillGray51:
      case IconButtonVariant.FillTealA700:
      case IconButtonVariant.none:
        return null;
      default:
        return [
          BoxShadow(
            color: ColorConstant.greenA40024,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(
              0,
              4,
            ),
          )
        ];
    }
  }
}

enum IconButtonPadding {
  PaddingAll13,
  PaddingAll5,
  PaddingAll1,
  none,
  PaddingAll10,
  PaddingAll16,
}

enum IconButtonShape {
  RoundedBorder22,
  RoundedBorder13,
  CircleBorder7,
  CircleBorder25,
  RoundedBorder18,
  CircleBorder35,
  none
}

enum IconButtonVariant {
  OutlineGreenA40024,
  FillIndigo600,
  OutlineWhiteA700,
  OutlineBlack9001a,
  FillTealA400,
  OutlineGreenA40024_1,
  FillWhiteA70026,
  OutlineGreenA4001a,
  OutlineGreenA40024_2,
  FillWhiteA700,
  FillGray51,
  OutlineDeeporange5002e,
  FillTealA700,
  none
}
