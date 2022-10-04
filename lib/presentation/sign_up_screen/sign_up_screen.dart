import 'controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/core/utils/validation_functions.dart';
import 'package:solution_ke/widgets/custom_button.dart';
import 'package:solution_ke/widgets/custom_checkbox.dart';
import 'package:solution_ke/widgets/custom_floating_edit_text.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';
import 'package:solution_ke/widgets/custom_text_form_field.dart';
import 'package:solution_ke/data/models/register/post_register_req.dart';
import 'package:solution_ke/domain/googleauth/google_auth_helper.dart';
import 'package:solution_ke/domain/facebookauth/facebook_auth_helper.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends GetWidget<SignUpController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: CustomIconButton(
                  height: 38,
                  width: 38,
                  padding: IconButtonPadding.none,
                  // margin: EdgeInsets.only(left: 25, top: 28, right: 25),
                  alignment: Alignment.centerRight,
                  onTap: () {
                    onTapBtnBack();
                  },
                  child: CommonImageView(svgPath: ImageConstant.imgArrowleft)),
              backgroundColor: ColorConstant.black900,
              elevation: 0,
            ),
            backgroundColor: ColorConstant.black900,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 25, top: 40, right: 25),
                                      child: Text("lbl_sign_up3".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsSemiBold40
                                              .copyWith(height: 1.00)))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 25, top: 15, right: 25),
                                      child: Text("msg_create_your_acc".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsRegular14
                                              .copyWith(height: 1.00)))),
                              Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                      left: 25, top: 20, right: 25),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomTextFormField(
                                            width: double.infinity,
                                            focusNode: FocusNode(),
                                            controller:
                                                controller.nameController,
                                            hintText: "lbl_name".tr,
                                            margin: EdgeInsets.only(top: 10),
                                            validator: (value) {
                                              if (!isText(value)) {
                                                return "Please enter valid text";
                                              }
                                              return null;
                                            }),
                                        CustomTextFormField(
                                            width: double.infinity,
                                            focusNode: FocusNode(),
                                            controller:
                                                controller.emailController,
                                            hintText: "Enter email",
                                            margin: EdgeInsets.only(top: 10),
                                            validator: (value) {
                                              if (!isValidEmail(value)) {
                                                return "Please enter valid email";
                                              }
                                              return null;
                                            }),
                                        // CustomFloatingEditText(
                                        //     width: double.infinity,
                                        //     focusNode: FocusNode(),
                                        //     controller: controller
                                        //         .guardianAngelController,
                                        //     labelText: "lbl_name".tr,
                                        //     hintText:
                                        //         "lbl_guardian_angel".tr,
                                        //     validator: (value) {
                                        //       if (!isText(value)) {
                                        //         return "Please enter valid text";
                                        //       }
                                        //       return null;
                                        //     }),
                                        CustomTextFormField(
                                            width: double.infinity,
                                            focusNode: FocusNode(),
                                            controller:
                                                controller.phoneController,
                                            hintText: "lbl_phone_number".tr,
                                            margin: EdgeInsets.only(top: 10),
                                            validator: (value) {
                                              if (!isValidPhone(value)) {
                                                return "Please enter valid phone number";
                                              }
                                              return null;
                                            }),
                                        CustomTextFormField(
                                            width: double.infinity,
                                            focusNode: FocusNode(),
                                            controller:
                                                controller.usernameController,
                                            hintText: "Enter username",
                                            margin: EdgeInsets.only(top: 10),
                                            validator: (value) {
                                              if (!isText(value)) {
                                                return "Please enter valid username";
                                              }
                                              return null;
                                            }),
                                        CustomTextFormField(
                                            width: double.infinity,
                                            focusNode: FocusNode(),
                                            isObscureText: true,
                                            controller:
                                                controller.passwordController,
                                            hintText: "Enter password",
                                            margin: EdgeInsets.only(top: 10),
                                            textInputAction:
                                                TextInputAction.done)
                                      ])),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 25, top: 20, right: 25),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
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
                                              style:
                                                  AppStyle.txtPoppinsRegular12,
                                              children: [
                                                TextSpan(
                                                    text:
                                                        "msg_terms_conditi".tr,
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
                                      ])),
                              CustomButton(
                                  width: double.infinity,
                                  text: "lbl_sign_up3".tr,
                                  margin: EdgeInsets.only(
                                      left: 25, top: 15, right: 25),
                                  onTap: onTapSignup,
                                  alignment: Alignment.center),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 25, top: 20, right: 25),
                                      child: Text("lbl_skip".tr,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyle
                                              .txtPoppinsMedium12WhiteA700))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 25, top: 5, right: 25),
                                      child: CommonImageView(
                                          svgPath: ImageConstant.imgDots,
                                          height: 1,
                                          width: 40))),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25, top: 17, right: 25),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomIconButton(
                                            height: 27,
                                            width: 27,
                                            variant:
                                                IconButtonVariant.FillIndigo600,
                                            shape:
                                                IconButtonShape.RoundedBorder13,
                                            padding:
                                                IconButtonPadding.PaddingAll5,
                                            onTap: () {
                                              onTapImgGoogle();
                                            },
                                            child: CommonImageView(
                                                svgPath:
                                                    ImageConstant.imgGoogle)),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 4, bottom: 5),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: CommonImageView(
                                                          svgPath: ImageConstant
                                                              .imgDots,
                                                          height: 1,
                                                          width: 40)),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15,
                                                          top: 4,
                                                          right: 15),
                                                      child: Text("lbl_or".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPoppinsMedium12WhiteA700
                                                              .copyWith(
                                                                  height:
                                                                      1.00)))
                                                ])),
                                        CustomIconButton(
                                            height: 27,
                                            width: 27,
                                            margin: EdgeInsets.only(left: 10),
                                            variant:
                                                IconButtonVariant.FillIndigo600,
                                            shape:
                                                IconButtonShape.RoundedBorder13,
                                            padding:
                                                IconButtonPadding.PaddingAll5,
                                            onTap: () {
                                              onTapBtnFacebook();
                                            },
                                            child: CommonImageView(
                                                svgPath:
                                                    ImageConstant.imgFacebook))
                                      ])),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 20, top: 20),
                                      child: InkWell(
                                        onTap: () => onTapBtnBack(),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 1),
                                                  child: Text(
                                                      "msg_have_account_l".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsRegular12)),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text("lbl_sign_in2".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsMedium12
                                                          .copyWith(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline)))
                                            ]),
                                      )))
                            ]))))));
  }

  onTapBtnBack() {
    Get.back();
  }

  void onTapSignup() {
    PostRegisterReq postRegisterReq = PostRegisterReq(
        mobileNo: controller.phoneController.text,
        username: controller.usernameController.text,
        password: controller.passwordController.text,
        name: controller.nameController.text,
        email: controller.emailController.text);
    controller.register(
      postRegisterReq.toJson(),
      successCall: _onRegisterUserSuccess,
      errCall: _onRegisterUserError,
    );
  }

  void _onRegisterUserSuccess() {
    Get.find<PrefUtils>().setUserID(controller.postRegisterResp.data!.id!);
    Get.toNamed(AppRoutes.loginScreen);
  }

  void _onRegisterUserError() {
    Get.snackbar('', controller.postRegisterResp.message!.toString());
  }

  onTapImgGoogle() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapBtnFacebook() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }
}
