import 'controller/purchase_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_button.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';
import 'package:solution_ke/widgets/custom_radio_button.dart';
import 'package:solution_ke/widgets/custom_text_form_field.dart';

class PurchaseScreen extends GetWidget<PurchaseController> {
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
                    onTapBtntf();
                  },
                  child: CommonImageView(svgPath: ImageConstant.imgArrowleft)),
              elevation: 0,
              backgroundColor: ColorConstant.black900,
              title: Text("lbl_purchases".tr,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.txtPoppinsMedium20),
              centerTitle: true,
            ),
            backgroundColor: ColorConstant.black900,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                      Container(
                          height: 200,
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 25, top: 40, right: 15),
                          child: Stack(children: [
                            CommonImageView(
                                color: Colors.teal,
                                url: controller.album?.artwork,
                                height: double.infinity,
                                width: double.infinity),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: AppDecoration.outlineBlack9000d,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text.rich(
                                            TextSpan(
                                                text: controller.album?.name),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style:
                                                AppStyle.txtPoppinsSemiBold20),
                                        Text.rich(
                                            TextSpan(
                                                text: controller
                                                    .album?.artist?.name),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSFProDisplaySemibold9),
                                        CommonImageView(
                                            svgPath: ImageConstant.imgLevels,
                                            height: 10,
                                            width: 80)
                                      ])),
                            )
                          ])),
                      Container(
                          width: double.infinity,
                          padding:
                              EdgeInsets.only(left: 25, top: 25, right: 25),
                          child: Text.rich(
                              TextSpan(text: "KES", children: [
                                TextSpan(
                                    text:
                                        controller.album?.basePrice?.toString())
                              ]),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsSemiBold20)),
                      Divider(
                        height: 40,
                        color: ColorConstant.whiteA70026,
                      ),
                      Text("lbl_payment_option".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsMedium18),
                      Obx(() => Padding(
                            padding: const EdgeInsets.only(left: 25, top: 10),
                            child: Column(children: [
                              CustomRadioButton(
                                  text: "lbl_card".tr,
                                  iconSize: 24,
                                  value: controller
                                      .purchaseModelObj.value.radioList[0],
                                  groupValue: controller.radioGroup.value,
                                  onChange: (value) {
                                    controller.radioGroup.value = value;
                                  }),
                              CustomRadioButton(
                                  text: "lbl_equitel".tr,
                                  iconSize: 24,
                                  value: controller
                                      .purchaseModelObj.value.radioList[1],
                                  groupValue: controller.radioGroup.value,
                                  onChange: (value) {
                                    controller.radioGroup.value = value;
                                  }),
                              CustomRadioButton(
                                  text: "lbl_mpesa".tr,
                                  iconSize: 24,
                                  value: controller
                                      .purchaseModelObj.value.radioList[2],
                                  groupValue: controller.radioGroup.value,
                                  onChange: (value) {
                                    controller.radioGroup.value = value;
                                  })
                            ]),
                          )),
                      CustomTextFormField(
                          width: double.infinity,
                          focusNode: FocusNode(),
                          controller: controller.phonenumberController,
                          hintText: "lbl_0700_000_000".tr,
                          margin: EdgeInsets.only(left: 25, top: 30, right: 25),
                          variant: TextFormFieldVariant.OutlineDeeporange50084,
                          textInputAction: TextInputAction.done,
                          alignment: Alignment.center),
                      CustomButton(
                          width: double.infinity,
                          text: "lbl_proceed".tr,
                          margin: EdgeInsets.only(left: 25, top: 30, right: 25),
                          variant: ButtonVariant.FillDeeporange500,
                          padding: ButtonPadding.PaddingAll11,
                          fontStyle: ButtonFontStyle.PoppinsMedium20,
                          onTap: onTapBtnProceed,
                          alignment: Alignment.center),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding:
                                  EdgeInsets.only(left: 25, top: 27, right: 25),
                              child: Text("lbl_powered_by".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsMediumItalic8))),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25, top: 10, right: 25, bottom: 20),
                          child: CommonImageView(
                              svgPath: ImageConstant.ingTendePayLogo,
                              width: 55))
                    ])))));
  }

  onTapPurchase() {
    Get.toNamed(AppRoutes.confirmPurchaseScreen);
  }

  onTapBtntf() {
    Get.back();
  }

  onTapBtnProceed() {
    Get.toNamed(AppRoutes.confirmPurchaseScreen);
  }
}
