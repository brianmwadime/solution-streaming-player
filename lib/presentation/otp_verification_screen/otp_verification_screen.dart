import 'controller/otp_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_button.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';
import 'package:solution_ke/data/models/loginWithOtp/post_login_with_otp_req.dart';

class OtpVerificationScreen extends GetWidget<OtpVerificationController> {
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
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              backgroundColor: Colors.transparent,
              body: Container(
                  width: size.width,
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        Padding(
                            padding:
                                EdgeInsets.only(left: 25, top: 40, right: 25),
                            child: Text("lbl_otp".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsSemiBold40
                                    .copyWith(height: 1.00))),
                        Container(
                            width: double.infinity,
                            margin:
                                EdgeInsets.only(left: 25, top: 20, right: 25),
                            child: Text("msg_we_are_waiting".tr,
                                maxLines: null,
                                textAlign: TextAlign.center,
                                style: AppStyle.txtPoppinsRegular14)),
                        Padding(
                            padding:
                                EdgeInsets.only(left: 25, top: 20, right: 25),
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
                                        activeColor:
                                            ColorConstant.gray60075))))),
                        CustomButton(
                            width: double.infinity,
                            text: "lbl_proceed".tr,
                            fontStyle: ButtonFontStyle.PoppinsMedium20,
                            margin:
                                EdgeInsets.only(left: 25, top: 65, right: 25),
                            onTap: onTapBtnProceed)
                      ]))))),
    );
  }

  onTapBtnBack() {
    Get.back();
  }

  void onTapBtnProceed() {
    PostLoginWithOtpReq postLoginWithOtpReq = PostLoginWithOtpReq(
        code: controller.otpController.value.text,
        username: Get.arguments["username"]);
    controller.callCreateLoginWithOtp(
      postLoginWithOtpReq.toJson(),
      successCall: _onVerifyOtpSuccess,
      errCall: _onVerifyOtpError,
    );
  }

  void _onVerifyOtpSuccess() {
    Get.find<PrefUtils>().setUserId(controller.postLoginWithOtpResp.data!.id!);
    Get.find<PrefUtils>().setUsername(
        controller.postLoginWithOtpResp.data!.username!.toString());
    Get.find<PrefUtils>()
        .setUserEmail(controller.postLoginWithOtpResp.data!.email!.toString());
    Get.find<PrefUtils>()
        .setName(controller.postLoginWithOtpResp.data!.name!.toString());
    Get.find<PrefUtils>()
        .setUserType(controller.postLoginWithOtpResp.data!.userType!);
    Get.find<PrefUtils>()
        .setToken(controller.postLoginWithOtpResp.data!.token!.toString());
    Get.offAllNamed(AppRoutes.initialRoute, arguments: {
      NavigationArgs.userid: controller.postLoginWithOtpResp.data!.id!
    });
  }

  void _onVerifyOtpError() {
    Get.snackbar(
        '', controller.postLoginWithOtpResp.message ?? "try again later.");
  }
}
