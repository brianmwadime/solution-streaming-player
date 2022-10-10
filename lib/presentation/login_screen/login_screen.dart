import 'package:solution_ke/core/utils/validation_functions.dart';
import 'package:solution_ke/widgets/custom_checkbox.dart';

import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_button.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';
import 'package:solution_ke/widgets/custom_text_form_field.dart';
import 'package:solution_ke/data/models/sendLoginOtp/post_send_login_otp_req.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: Image.asset(ImageConstant.background).image,
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter),
        color: ColorConstant.black900,
      ),
      child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                leading: CustomIconButton(
                    padding: IconButtonPadding.PaddingAll1,
                    height: 38,
                    width: 38,
                    alignment: Alignment.centerRight,
                    onTap: () {
                      onTapBtnBack();
                    },
                    child:
                        CommonImageView(svgPath: ImageConstant.imgArrowleft)),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              backgroundColor: Colors.transparent,
              body: Container(
                  width: size.width,
                  child: SingleChildScrollView(
                      child: Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.only(
                                            left: 25, top: 43, right: 25),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 25, right: 25),
                                                  child: Text("lbl_sign_in".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsSemiBold40
                                                          .copyWith(
                                                              height: 1.00))),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 15,
                                                  ),
                                                  child: Text(
                                                      "msg_kindly_enter_yo".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: AppStyle
                                                          .txtPoppinsRegular14
                                                          .copyWith(
                                                              height: 1.00))),
                                              CustomTextFormField(
                                                  width: double.infinity,
                                                  focusNode: FocusNode(),
                                                  controller: controller
                                                      .phoneNumberFieldController,
                                                  hintText:
                                                      "lbl_phone_number".tr,
                                                  margin: EdgeInsets.only(
                                                      top: 40, bottom: 20),
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  alignment: Alignment.center,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Please enter valid username/phone number";
                                                    }
                                                    return null;
                                                  })
                                            ]))),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Obx(() => CustomCheckbox(
                                          iconSize: 24,
                                          value: controller.tos.value,
                                          onChange: (value) {
                                            controller.tos.value = value;
                                          })),
                                      Text.rich(
                                        TextSpan(
                                            text: "lbl_i_accept".tr,
                                            style: AppStyle.txtPoppinsRegular12,
                                            children: [
                                              TextSpan(
                                                  text: "msg_terms_conditi".tr,
                                                  style: AppStyle
                                                      .txtPoppinsMedium12
                                                      .copyWith(
                                                          height: 1.00,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline))
                                            ]),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                      ),
                                    ]),
                                CustomButton(
                                    width: double.infinity,
                                    text: "lbl_proceed".tr,
                                    margin: EdgeInsets.all(20),
                                    onTap: onTapBtnProceed,
                                    alignment: Alignment.center),
                                Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: EdgeInsets.all(25),
                                        child: Text("lbl_skip".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtPoppinsMedium12WhiteA700
                                                .copyWith(height: 1.00)))),
                                Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 25, top: 5, right: 25),
                                        child: CommonImageView(
                                            svgPath: ImageConstant.imgDots,
                                            height: getVerticalSize(1.00),
                                            width: getHorizontalSize(43.00)))),
                                Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 25, top: 32, right: 25),
                                        child: InkWell(
                                          onTap: () => onTapRegister(),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 1),
                                                    child: Text(
                                                        "msg_don_t_have_acco"
                                                            .tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsRegular12
                                                            .copyWith(
                                                                height: 1.00))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 1, top: 1),
                                                    child: Text(
                                                        "lbl_sign_up".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsMedium12
                                                            .copyWith(
                                                                height: 1.00,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline)))
                                              ]),
                                        ))),
                                Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 25,
                                            top: 25,
                                            right: 25,
                                            bottom: 25),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    onTapImgGoogle();
                                                  },
                                                  child: CommonImageView(
                                                      svgPath: ImageConstant
                                                          .imgGoogle,
                                                      height: 24,
                                                      width: 24)),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10,
                                                      top: 4,
                                                      bottom: 5),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: CommonImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgDots,
                                                                height:
                                                                    getVerticalSize(
                                                                        1.00),
                                                                width:
                                                                    getHorizontalSize(
                                                                        43.00))),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 15,
                                                                    top: 4,
                                                                    right: 15),
                                                            child: Text(
                                                                "lbl_or".tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtPoppinsMedium12WhiteA700
                                                                    .copyWith(
                                                                        height:
                                                                            1.00)))
                                                      ])),
                                              CustomIconButton(
                                                  height: 24,
                                                  width: 24,
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  variant: IconButtonVariant
                                                      .FillIndigo600,
                                                  shape: IconButtonShape
                                                      .RoundedBorder13,
                                                  padding: IconButtonPadding
                                                      .PaddingAll5,
                                                  onTap: () {
                                                    onTapBtnFacebook();
                                                  },
                                                  child: CommonImageView(
                                                      svgPath: ImageConstant
                                                          .imgFacebook))
                                            ])))
                              ])))))),
    );
  }

  onTapLogin() {
    Get.toNamed(AppRoutes.otpVerificationScreen);
  }

  onTapRegister() {
    Get.toNamed(AppRoutes.signUpScreen);
  }

  onTapBtnBack() {
    Get.back();
  }

  void onTapBtnProceed() {
    if (_formKey.currentState!.validate()) {
      PostSendLoginOtpReq postSendLoginOtpReq = PostSendLoginOtpReq(
        username: controller.phoneNumberFieldController.text,
      );
      controller.requestLoginOtp(
        postSendLoginOtpReq.toJson(),
        successCall: _onLoginUserSuccess,
        errCall: _onLoginUserError,
      );
    }
  }

  void _onLoginUserSuccess() {
    Get.toNamed(AppRoutes.otpVerificationScreen, arguments: {
      NavigationArgs.username: controller.phoneNumberFieldController.text
    });
  }

  void _onLoginUserError() {
    // Get.snackbar('', controller.postSendLoginOtpResp.message!.toString());
  }

  onTapImgGoogle() async {
    var url = 'https://accounts.google.com/';
    if (!await launch(url)) {
      throw 'Could not launch https://accounts.google.com/';
    }
  }

  onTapBtnFacebook() async {
    var url = 'https://www.facebook.com/login/';
    if (!await launch(url)) {
      throw 'Could not launch https://www.facebook.com/login/';
    }
  }
}
