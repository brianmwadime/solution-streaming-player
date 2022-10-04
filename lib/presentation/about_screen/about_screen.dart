import 'controller/about_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_button.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';

class AboutScreen extends GetWidget<AboutController> {
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
                leading: CustomIconButton(
                    padding: IconButtonPadding.PaddingAll1,
                    height: 38,
                    width: 38,
                    alignment: Alignment.centerRight,
                    onTap: () {
                      onTapBtntf();
                    },
                    child:
                        CommonImageView(svgPath: ImageConstant.imgArrowleft)),
                title: Text("lbl_about".tr,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.txtPoppinsMedium20),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Padding(
                        padding: EdgeInsets.only(top: 80, right: 20, left: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              CommonImageView(
                                  svgPath: ImageConstant.imgEnvelope,
                                  height: getVerticalSize(19.00),
                                  width: getHorizontalSize(25.00)),
                              Padding(
                                  padding:
                                      getPadding(left: 14, top: 5, bottom: 1),
                                  child: Text("msg_info_solutionsk".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsMedium14
                                          .copyWith(height: 1.00)))
                            ])),
                    Padding(
                        padding: getPadding(top: 30, right: 20, left: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              CommonImageView(
                                  svgPath: ImageConstant.imgInstagram,
                                  height: getSize(25.00),
                                  width: getSize(25.00)),
                              Padding(
                                  padding:
                                      getPadding(left: 14, top: 8, bottom: 3),
                                  child: Text("msg_solutionske_co".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsMedium14
                                          .copyWith(height: 1.00)))
                            ])),
                    Padding(
                        padding: getPadding(top: 30, right: 20, left: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                  onTap: () {
                                    onTapImgTwitter();
                                  },
                                  child: CommonImageView(
                                      svgPath: ImageConstant.imgTwitter,
                                      height: getSize(25.00),
                                      width: getSize(25.00))),
                              Padding(
                                  padding:
                                      getPadding(left: 14, top: 7, bottom: 4),
                                  child: Text("msg_solutionske_co".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsMedium14
                                          .copyWith(height: 1.00)))
                            ])),
                    Padding(
                        padding: getPadding(top: 20, right: 20, left: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                  onTap: () {
                                    onTapImgFacebook();
                                  },
                                  child: CommonImageView(
                                      svgPath: ImageConstant.imgFacebook25X25,
                                      height: getSize(25.00),
                                      width: getSize(25.00))),
                              Padding(
                                  padding:
                                      getPadding(left: 14, top: 7, bottom: 4),
                                  child: Text("msg_solutionske_co".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsMedium14
                                          .copyWith(height: 1.00)))
                            ])),
                    Padding(
                        padding: getPadding(left: 20, top: 30, right: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CommonImageView(
                                  svgPath: ImageConstant.imgEnvelope,
                                  height: getVerticalSize(19.00),
                                  width: getHorizontalSize(25.00)),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtWwwsolutionsk();
                                  },
                                  child: Padding(
                                      padding: getPadding(
                                          left: 14, top: 3, bottom: 1),
                                      child: Text("msg_www_solutions_k".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsMedium14
                                              .copyWith(height: 1.00))))
                            ])),
                    CustomButton(
                        width: double.infinity,
                        text: "lbl_call_us".tr,
                        margin:
                            getMargin(left: 20, top: 40, right: 25, bottom: 20))
                  ])))),
    );
  }

  onTapBtntf() {
    Get.back();
  }

  onTapImgTwitter() async {
    var url = 'https://twitter.com/login/';
    if (!await launch(url)) {
      throw 'Could not launch https://twitter.com/login/';
    }
  }

  onTapImgFacebook() async {
    var url = 'https://www.facebook.com/login/';
    if (!await launch(url)) {
      throw 'Could not launch https://www.facebook.com/login/';
    }
  }

  onTapTxtWwwsolutionsk() async {
    var url = 'www.Solutions.ke';
    if (!await launch(url)) {
      throw 'Could not launch www.Solutions.ke';
    }
  }
}
