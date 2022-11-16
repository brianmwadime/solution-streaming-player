import 'package:hive/hive.dart';

import 'controller/change_bio_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_button.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';
import 'package:solution_ke/widgets/custom_text_form_field.dart';
import 'package:solution_ke/data/models/updateProfile/profile_request.dart';

class ChangeBioScreen extends GetWidget<ChangeBioController> {
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
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
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
                  title: Text("lbl_change_bio".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsMedium20),
                  centerTitle: true,
                  actions: []),
              backgroundColor: Colors.transparent,
              body: Container(
                  child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).viewPadding.top),
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 25,
                              top: MediaQuery.of(context).viewPadding.top + 50,
                              right: 25,
                              bottom: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomTextFormField(
                                  width: double.infinity,
                                  controller: controller.nameController,
                                  hintText: "Enter name",
                                ),
                                CustomTextFormField(
                                    width: double.infinity,
                                    controller: controller.aliasController,
                                    hintText: "Enter username",
                                    margin: EdgeInsets.only(top: 20),
                                    textInputAction: TextInputAction.done),
                                CustomButton(
                                    margin: EdgeInsets.only(top: 20),
                                    width: double.infinity,
                                    text: "lbl_update".tr,
                                    onTap: onTapBtnUpdate),
                              ])))))),
    );
  }

  onTapChangeBio() {
    Get.toNamed(AppRoutes.purchaseHistoryScreen);
  }

  onTapBtnBack() {
    Get.back();
  }

  void onTapBtnUpdate() {
    PutUpdateProfileReq putUpdateProfileReq = PutUpdateProfileReq(
      name: controller.nameController.text,
      username: controller.aliasController.text,
    );
    controller.callUpdateUpdateProfile(
      putUpdateProfileReq.toJson(),
      successCall: _onUpdateBioSuccess,
      errCall: _onUpdateBioError,
    );
  }

  void _onUpdateBioSuccess() {
    Hive.box("settings").putAll({
      "name": controller.profileResponse.data?.name,
      "username": controller.profileResponse.data?.username
    });
  }

  void _onUpdateBioError() {
    Get.defaultDialog(
        onConfirm: () => Get.back(),
        title: 'Solution',
        middleText: controller.profileResponse.message ?? "Try again later.");
  }
}
