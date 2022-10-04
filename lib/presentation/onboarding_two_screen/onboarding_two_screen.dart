import '../onboarding_two_screen/widgets/slideshow1_item_widget.dart';
import 'controller/onboarding_two_controller.dart';
import 'models/slideshow1_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_button.dart';

class OnboardingTwoScreen extends GetWidget<OnboardingTwoController> {
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
                          onTapOnboardingTw();
                        },
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: getPadding(top: 43),
                                  child: Obx(() => CarouselSlider.builder(
                                      options: CarouselOptions(
                                          height: getVerticalSize(378.00),
                                          initialPage: 0,
                                          autoPlay: true,
                                          viewportFraction: 1.0,
                                          enableInfiniteScroll: false,
                                          scrollDirection: Axis.horizontal,
                                          onPageChanged: (index, reason) {
                                            controller.silderIndex.value =
                                                index;
                                          }),
                                      itemCount: controller
                                          .onboardingTwoModelObj
                                          .value
                                          .slideshow1ItemList
                                          .length,
                                      itemBuilder: (context, index, realIndex) {
                                        Slideshow1ItemModel model = controller
                                            .onboardingTwoModelObj
                                            .value
                                            .slideshow1ItemList[index];
                                        return Slideshow1ItemWidget(model);
                                      }))),
                              Obx(() => Container(
                                  height: getVerticalSize(6.00),
                                  margin:
                                      getMargin(left: 27, top: 20, right: 27),
                                  child: AnimatedSmoothIndicator(
                                      activeIndex: controller.silderIndex.value,
                                      count: controller.onboardingTwoModelObj
                                          .value.slideshow1ItemList.length,
                                      axisDirection: Axis.horizontal,
                                      effect: ScrollingDotsEffect(
                                          spacing: 6,
                                          activeDotColor:
                                              ColorConstant.whiteA700,
                                          dotColor: ColorConstant.whiteA70024,
                                          dotHeight: getVerticalSize(6.00),
                                          dotWidth: getHorizontalSize(6.00))))),
                              Container(
                                  width: getHorizontalSize(314.00),
                                  margin:
                                      getMargin(left: 27, top: 23, right: 27),
                                  child: Text("msg_your_content_ma".tr,
                                      maxLines: null,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtPoppinsSemiBold30
                                          .copyWith(height: 1.40))),
                              Container(
                                  width: getHorizontalSize(241.00),
                                  margin:
                                      getMargin(left: 27, top: 23, right: 27),
                                  child: Text("lbl_listen".tr,
                                      maxLines: null,
                                      style: AppStyle.txtRobotoRegular)),
                              CustomButton(
                                  width: 294,
                                  text: "lbl_sign_up2".tr,
                                  margin:
                                      getMargin(left: 27, top: 21, right: 27),
                                  variant: ButtonVariant.OutlineGreenA40040),
                              CustomButton(
                                  width: 294,
                                  text: "lbl_sign_in".tr,
                                  margin: getMargin(
                                      left: 27, top: 16, right: 27, bottom: 20),
                                  variant: ButtonVariant.OutlineTealA400,
                                  fontStyle:
                                      ButtonFontStyle.PoppinsMedium14WhiteA700)
                            ]))))));
  }

  onTapOnboardingTw() {
    Get.toNamed(AppRoutes.onboardingCategoryScreen);
  }
}
