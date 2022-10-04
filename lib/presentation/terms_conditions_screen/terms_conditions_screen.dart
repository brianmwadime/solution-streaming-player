import 'controller/terms_conditions_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';

class TermsConditionsScreen extends GetWidget<TermsConditionsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: CustomIconButton(
                  padding: IconButtonPadding.PaddingAll1,
                  height: 38,
                  width: 38,
                  alignment: Alignment.centerRight,
                  onTap: () {
                    onTapBtntf();
                  },
                  child: CommonImageView(svgPath: ImageConstant.imgArrowleft)),
              title: Text("msg_terms_conditi".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsMedium20Black900),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                      Container(
                          margin: EdgeInsets.all(25),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_welcome_to_solu2".tr,
                                    style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(15),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 2.00)),
                                TextSpan(
                                    text: "msg_agreement_to_te".tr,
                                    style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(15),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        height: 2.00)),
                                TextSpan(
                                    text: "msg_solutions_ke_te".tr,
                                    style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(15),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 2.00))
                              ]),
                              textAlign: TextAlign.left))
                    ])))));
  }

  onTapBtntf() {
    Get.back();
  }
}
