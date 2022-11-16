import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';

class AccountItemWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onClicked;

  const AccountItemWidget(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Padding(
          padding: EdgeInsets.only(left: 25, top: 0, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomIconButton(
                        height: 42,
                        width: 42,
                        variant: IconButtonVariant.FillGray51,
                        shape: IconButtonShape.CircleBorder7,
                        padding: IconButtonPadding.PaddingAll10,
                        child: CommonImageView(
                          svgPath: icon,
                          color: ColorConstant.tealA700,
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 12, top: 13, bottom: 14),
                        child: Text.rich(TextSpan(text: title),
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsMedium14
                                .copyWith(height: 1.00)))
                  ]),
              Container(
                  height: 1,
                  width: double.infinity,
                  margin:
                      EdgeInsets.only(left: 52, top: 16, right: 15, bottom: 20),
                  decoration: BoxDecoration(color: ColorConstant.gray200))
            ],
          )),
    );
  }
}
