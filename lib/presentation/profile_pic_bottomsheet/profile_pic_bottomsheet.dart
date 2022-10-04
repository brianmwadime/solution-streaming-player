import 'controller/profile_pic_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_floating_button.dart';

// ignore_for_file: must_be_immutable
class ProfilePicBottomsheet extends StatelessWidget {
  ProfilePicBottomsheet(this.controller);

  ProfilePicController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            height: getVerticalSize(808.00),
            width: size.width,
            child: Stack(alignment: Alignment.bottomLeft, children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                      onTap: () {
                        onTapProfilePic();
                      },
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("lbl_profile_photo".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsSemiBold18
                                    .copyWith(height: 1.00)),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                      padding: getPadding(bottom: 8),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: getPadding(
                                                    left: 12, right: 11),
                                                child: CommonImageView(
                                                    svgPath:
                                                        ImageConstant.imgClock,
                                                    height: getSize(48.00),
                                                    width: getSize(48.00))),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                    padding:
                                                        getPadding(top: 26),
                                                    child: Text(
                                                        "lbl_gallery".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsMedium20
                                                            .copyWith(
                                                                height: 1.00))))
                                          ])),
                                  Padding(
                                      padding: getPadding(
                                          left: 29, top: 72, bottom: 10),
                                      child: Text("lbl_camera".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsMedium20
                                              .copyWith(height: 1.00)))
                                ])
                          ]))),
              CustomFloatingButton(
                  height: 48,
                  width: 48,
                  shape: FloatingButtonShape.CircleBorder24,
                  alignment: Alignment.bottomLeft,
                  child: CommonImageView(
                      svgPath: ImageConstant.imgClockWhiteA700,
                      height: getVerticalSize(24.00),
                      width: getHorizontalSize(24.00)))
            ])));
  }

  onTapProfilePic() {
    Get.toNamed(AppRoutes.changeBioScreen);
  }
}
