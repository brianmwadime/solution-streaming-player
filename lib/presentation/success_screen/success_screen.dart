import 'controller/success_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';

class SuccessScreen extends GetWidget<SuccessController> {
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
              variant: IconButtonVariant.OutlineDeeporange5002e,
              onTap: () => onTapBtnBack(),
              child: CommonImageView(svgPath: ImageConstant.imgClose)),
          // leading: CustomIconButton(
          //   height: 45,
          //   width: 45,
          //   variant: IconButtonVariant.OutlineDeeporange5002e,
          //   padding: IconButtonPadding.PaddingAll16,
          //   child: CommonImageView(
          //     svgPath: ImageConstant.imgClose,
          //   ),
          // ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "lbl_purchase".tr,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.txtPoppinsMedium20,
          ),
          centerTitle: true,
        ),
        backgroundColor: ColorConstant.black900,
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 30,
                  top: 28,
                  right: 30,
                  bottom: 28,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 330,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        top: 39,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 330,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: ColorConstant.tealA700,
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorConstant.black9000d,
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(
                                      0,
                                      15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 200,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                CommonImageView(
                                  imagePath: ImageConstant.imgProductavatar,
                                  height: 200,
                                  width: double.infinity,
                                ),
                                Positioned(
                                  left: 10,
                                  right: 0,
                                  bottom: 10,
                                  child: Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "lbl_mkurugenzi".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsSemiBold20,
                                        ),
                                        Text(
                                          "lbl_young_stupid".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtSFProDisplaySemibold9,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: CommonImageView(
                                            svgPath: ImageConstant.imgLevels,
                                            height: 10,
                                            width: 77,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  elevation: 0,
                                  margin: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  color: ColorConstant.whiteA700,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusStyle.circleBorder39,
                                  ),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration:
                                        AppDecoration.fillWhiteA700.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder39,
                                    ),
                                    child: CustomIconButton(
                                      height: 70,
                                      width: 70,
                                      margin: EdgeInsets.all(
                                        4,
                                      ),
                                      variant: IconButtonVariant.FillTealA700,
                                      shape: IconButtonShape.CircleBorder35,
                                      padding: IconButtonPadding.PaddingAll5,
                                      alignment: Alignment.center,
                                      child: CommonImageView(
                                        svgPath:
                                            ImageConstant.imgCheckmark70X70,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    top: 10,
                                    right: 20,
                                  ),
                                  child: Text(
                                    "lbl_kes_100".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtPoppinsSemiBold20.copyWith(
                                      height: 1.00,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  width: 114,
                                  margin: EdgeInsets.only(
                                    top: 9,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA70026,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 19,
                                    top: 11,
                                    right: 19,
                                  ),
                                  child: Text(
                                    "lbl_paid".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtPoppinsSemiBold20.copyWith(
                                      height: 1.00,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: getVerticalSize(
                                    1.00,
                                  ),
                                  width: getHorizontalSize(
                                    114.00,
                                  ),
                                  margin: EdgeInsets.only(
                                    top: 7,
                                    bottom: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA70026,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 25,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomIconButton(
                                height: 45,
                                width: 45,
                                variant: IconButtonVariant.FillWhiteA70026,
                                padding: IconButtonPadding.PaddingAll16,
                                child: CommonImageView(
                                  svgPath: ImageConstant.imgArrowright,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 12,
                                ),
                                child: Text(
                                  "lbl_listen".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsMedium14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 48,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomIconButton(
                                height: 45,
                                width: 45,
                                margin: EdgeInsets.only(
                                  left: 3,
                                  right: 2,
                                ),
                                variant: IconButtonVariant.FillWhiteA70026,
                                padding: IconButtonPadding.PaddingAll16,
                                alignment: Alignment.center,
                                child: CommonImageView(
                                  svgPath: ImageConstant.imgArrowdown,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 12,
                                ),
                                child: Text(
                                  "lbl_add_to_playlist".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtPoppinsMedium14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapBtnBack() {}
}
