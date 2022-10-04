import 'package:solution_ke/widgets/custom_icon_button.dart';

import 'controller/confirm_purchase_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_button.dart';

class ConfirmPurchaseScreen extends GetWidget<ConfirmPurchaseController> {
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
                  variant: IconButtonVariant.OutlineGreenA40024_2,
                  onTap: () {
                    onTapBtnBack();
                  },
                  child: CommonImageView(svgPath: ImageConstant.imgArrowleft)),
              elevation: 0,
              backgroundColor: ColorConstant.black900,
              title: Text("lbl_purchases".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsMedium20),
              centerTitle: true,
            ),
            backgroundColor: ColorConstant.black900,
            body: Container(
                width: double.infinity,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 25, right: 25),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_confirm_payment2".tr,
                                    style: TextStyle(
                                        color: ColorConstant.whiteA700,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 2.50)),
                                TextSpan(
                                    text: "lbl_100".tr,
                                    style: TextStyle(
                                        color: ColorConstant.whiteA700,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        height: 2.50)),
                                TextSpan(
                                    text: "msg_to_solutions_ke".tr,
                                    style: TextStyle(
                                        color: ColorConstant.whiteA700,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 2.50))
                              ]),
                              textAlign: TextAlign.center)),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 25, right: 25, top: 50),
                        child: Text("Enter PIN",
                            style: TextStyle(
                                color: ColorConstant.whiteA700,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 2.50)),
                      ),
                      Padding(
                          padding: getPadding(left: 25, top: 8, right: 25),
                          child: Container(
                              width: 260,
                              child: Obx(() => PinCodeTextField(
                                  appContext: context,
                                  controller: controller.otpController.value,
                                  length: 4,
                                  obscureText: false,
                                  obscuringCharacter: '*',
                                  keyboardType: TextInputType.number,
                                  autoDismissKeyboard: true,
                                  enableActiveFill: true,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onChanged: (value) {},
                                  animationType: AnimationType.none,
                                  pinTheme: PinTheme(
                                      fieldHeight: 48,
                                      fieldWidth: 48,
                                      shape: PinCodeFieldShape.box,
                                      borderWidth: 0,
                                      borderRadius: BorderRadius.circular(4),
                                      selectedFillColor:
                                          ColorConstant.whiteA70075,
                                      activeFillColor:
                                          ColorConstant.whiteA70075,
                                      inactiveFillColor:
                                          ColorConstant.whiteA70075,
                                      inactiveColor: ColorConstant.gray60075,
                                      selectedColor: ColorConstant.gray60075,
                                      activeColor: ColorConstant.gray60075))))),
                      CustomButton(
                          width: double.infinity,
                          text: "lbl_pay".tr,
                          margin: EdgeInsets.only(left: 25, top: 50, right: 25),
                          variant: ButtonVariant.FillDeeporange500,
                          padding: ButtonPadding.PaddingAll11,
                          fontStyle: ButtonFontStyle.PoppinsMedium20,
                          onTap: onTapBtnPay,
                          alignment: Alignment.center)
                    ]))));
  }

  onTapConfirmPurchas() {
    Get.toNamed(AppRoutes.successScreen);
  }

  onTapBtnBack() {
    Get.back();
  }

  onTapBtnPay() {
    Get.toNamed(AppRoutes.successScreen);
  }
}
