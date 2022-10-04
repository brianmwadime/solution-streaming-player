import '../onboarding_artists_screen/widgets/category1_item_widget.dart';
import 'controller/onboarding_artists_controller.dart';
import 'models/onboarding_category_item_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_button.dart';

class OnboardingArtistsScreen extends GetWidget<OnboardingArtistsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.black900,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: GestureDetector(
                        onTap: () {
                          onTapOnboardingarti();
                        },
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  width: getHorizontalSize(322.00),
                                  margin:
                                      getMargin(left: 27, top: 90, right: 26),
                                  child: Text("msg_select_your_fav2".tr,
                                      maxLines: null,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtPoppinsSemiBold30
                                          .copyWith(height: 1.40))),
                              Padding(
                                  padding:
                                      getPadding(left: 27, top: 62, right: 27),
                                  child: Obx(() => GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisExtent:
                                                  getVerticalSize(151.00),
                                              crossAxisCount: 3,
                                              mainAxisSpacing:
                                                  getHorizontalSize(0.00),
                                              crossAxisSpacing:
                                                  getHorizontalSize(0.00)),
                                      physics: BouncingScrollPhysics(),
                                      itemCount: controller
                                          .onboardingArtistsModelObj
                                          .value
                                          .category1ItemList
                                          .length,
                                      itemBuilder: (context, index) {
                                        OnboardingArtistItemModel model =
                                            controller.onboardingArtistsModelObj
                                                .value.category1ItemList[index];
                                        return Category1ItemWidget(model);
                                      }))),
                              CustomButton(
                                  width: 294,
                                  text: "lbl_next".tr,
                                  margin:
                                      getMargin(left: 27, top: 50, right: 27),
                                  variant: ButtonVariant.OutlineGreenA40040_1),
                              CustomButton(
                                  width: 294,
                                  text: "lbl_skip".tr,
                                  margin: getMargin(
                                      left: 27, top: 12, right: 27, bottom: 28),
                                  variant: ButtonVariant.OutlineGray600,
                                  fontStyle: ButtonFontStyle
                                      .PoppinsMedium14WhiteA70099)
                            ]))))));
  }

  onTapOnboardingarti() {
    Get.toNamed(AppRoutes.signUpScreen);
  }
}
