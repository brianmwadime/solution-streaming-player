import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

class CustomRadioButton extends StatelessWidget {
  CustomRadioButton(
      {Key? key,
      this.padding,
      this.shape,
      this.fontStyle,
      this.margin,
      this.onChange,
      this.iconSize,
      this.value,
      this.groupValue,
      this.text})
      : super(key: key);

  final RadioPadding? padding;

  final RadioShape? shape;

  final RadioFontStyle? fontStyle;

  final EdgeInsetsGeometry? margin;

  final Function(String)? onChange;

  final double? iconSize;

  final String? value;

  final String? groupValue;

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          onChange!(value!);
        },
        child: Row(
          children: [
            SizedBox(
              height: iconSize ?? 0,
              width: iconSize ?? 0,
              child: Radio<String>(
                value: value ?? "",
                groupValue: groupValue,
                onChanged: (value) {
                  onChange!(value!);
                },
                fillColor: _setFillColor(),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Text.rich(
                TextSpan(text: text),
                style: _setFontStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
    }
  }

  _setFillColor() {
    return MaterialStateColor.resolveWith((Set<MaterialState> states) {
      // if (states.contains(MaterialState.hovered)) {
      //   return Colors.orange;
      // } else if (states.contains(MaterialState.selected)) {
      //   return Colors.teal;
      // }
      // if (states.contains(MaterialState.focused)) {
      //   return Colors.blue;
      // } else {
      //   return Colors.red;
      // }
      return ColorConstant.deepOrange500;
    });
  }
}

enum RadioPadding {
  PaddingAll3,
}

enum RadioShape {
  RoundedBorder10,
}

enum RadioFontStyle {
  PoppinsMedium14,
}
