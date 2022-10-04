import 'package:solution_ke/presentation/account_screen/widgets/account_item.dart';

import 'controller/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/presentation/profile_pic_bottomsheet/profile_pic_bottomsheet.dart';
import 'package:solution_ke/presentation/profile_pic_bottomsheet/controller/profile_pic_controller.dart';

class AccountScreen extends GetWidget<AccountController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text("lbl_account".tr,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.txtPoppinsMedium20),
                centerTitle: true,
                actions: []),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Container(
                      padding: EdgeInsets.only(left: 25, top: 25),
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(clipBehavior: Clip.none, children: [
                              Container(
                                  height: 68,
                                  width: 68,
                                  decoration: AppDecoration.fillTealA400
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder7),
                                  child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child: CommonImageView(
                                          imagePath:
                                              ImageConstant.imgAvatar64X62,
                                          height: double.infinity,
                                          width: double.infinity))),
                              Positioned(
                                top: -16,
                                right: -16,
                                child: InkWell(
                                    onTap: () {
                                      requestCameraGalleryPermission();
                                    },
                                    child: CommonImageView(
                                        svgPath: ImageConstant.imgClock,
                                        height: 32,
                                        width: 32)),
                              )
                            ]),
                            Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Text.rich(
                                              TextSpan(
                                                  text: Get.find<PrefUtils>()
                                                      .getName()),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsSemiBold15)),
                                      Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text("lbl_0700_000_000".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsRegular10
                                                  .copyWith(height: 1.00)))
                                    ]))
                          ])),
                  SizedBox(
                    height: 50,
                  ),
                  AccountItemWidget(
                    title: "lbl_change_photo".tr,
                    icon: ImageConstant.imgUser,
                    onClicked: () => onTapChangePhoto(),
                  ),
                  AccountItemWidget(
                    title: "lbl_change_bio".tr,
                    icon: ImageConstant.imgUser,
                    onClicked: () => Get.toNamed(AppRoutes.changeBioScreen),
                  ),
                  AccountItemWidget(
                    title: "msg_purchase_histor".tr,
                    icon: ImageConstant.imgUserPayments,
                    onClicked: () =>
                        Get.toNamed(AppRoutes.purchaseHistoryScreen),
                  ),
                  AccountItemWidget(
                    title: "msg_terms_of_servic".tr,
                    icon: ImageConstant.imgCar,
                    onClicked: () =>
                        Get.toNamed(AppRoutes.termsConditionsScreen),
                  ),
                  AccountItemWidget(
                    title: "About",
                    icon: ImageConstant.imgInfo,
                    onClicked: () => Get.toNamed(AppRoutes.aboutScreen),
                  ),
                  AccountItemWidget(
                    title: "Logout",
                    icon: ImageConstant.imgInfo,
                    onClicked: () => logout(),
                  )
                ]))));
  }

  logout() {
    controller.logout(successCall: _onSuccess);
  }

  onTapAccount() {
    Get.bottomSheet(
      ProfilePicBottomsheet(
        Get.put(
          ProfilePicController(),
        ),
      ),
      isScrollControlled: true,
    );
  }

  _onSuccess() {
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  onTapBtnBack() {
    Get.back();
  }

  requestCameraGalleryPermission() async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
//TODO: Permission - use imageList for using selected images
    await FileManager().showModelSheetForImage(getImages: (value) async {
      imageList = value;
    });
  }

  onTapChangePhoto() async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
//TODO: Permission - use imageList for using selected images
    await FileManager().showModelSheetForImage(getImages: (value) async {
      imageList = value;
    });
  }
}
