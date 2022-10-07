import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String? title;
  final VoidCallback onTapMore;
  SectionHeaderWidget({Key? key, required this.title, required this.onTapMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text.rich(TextSpan(text: title),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsSemiBold18),
              GestureDetector(
                onTap: onTapMore,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("lbl_view_all".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsMedium11),
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: CommonImageView(
                              svgPath: ImageConstant.imgChevicon,
                              height: 10,
                              width: 5))
                    ]),
              )
            ]));
  }
}
