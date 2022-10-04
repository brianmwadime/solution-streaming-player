import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

class CustomCheckbox extends StatelessWidget {
  CustomCheckbox(
      {this.alignment,
      this.padding,
      this.iconSize,
      this.value,
      this.onChange,
      this.text});

  final Alignment? alignment;

  final EdgeInsetsGeometry? padding;

  final double? iconSize;

  bool? value;

  final Function(bool)? onChange;

  final String? text;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildCheckboxWidget(),
          )
        : _buildCheckboxWidget();
  }

  _buildCheckboxWidget() {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          value = !(value!);
          onChange!(value!);
        },
        child: Row(
          children: [
            SizedBox(
              height: iconSize ?? 0,
              width: iconSize ?? 0,
              child: Checkbox(
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return ColorConstant.whiteA700A1;
                  // if (states.contains(MaterialState.disabled)) {
                  //   return Colors.orange.withOpacity(.32);
                  // }
                  // return Colors.orange;
                }),
                checkColor: Colors.black,
                value: value ?? false,
                onChanged: (value) {
                  onChange!(value!);
                },
              ),
            ),
            Padding(
              padding: getPadding(
                left: 10,
              ),
              child: Text(
                text ?? "",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
