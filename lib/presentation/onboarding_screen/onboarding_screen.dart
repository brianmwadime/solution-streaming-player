import '../onboarding_screen/widgets/slideshow_item_widget.dart';
import 'controller/onboarding_controller.dart';
import 'models/slideshow_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_button.dart';

class OnboardingScreen extends GetWidget<OnboardingController> {
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
                          onTapOnboarding2();
                        },
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding:
                                      getPadding(left: 20, top: 16, right: 20),
                                  child: CommonImageView(
                                      svgPath: ImageConstant.imgVolume,
                                      height: getVerticalSize(56.00),
                                      width: getHorizontalSize(69.00))),
                              Padding(
                                  padding: getPadding(top: 17),
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
                                      itemCount: controller.onboardingModelObj
                                          .value.slideshowItemList.length,
                                      itemBuilder: (context, index, realIndex) {
                                        SlideshowItemModel model = controller
                                            .onboardingModelObj
                                            .value
                                            .slideshowItemList[index];
                                        return SlideshowItemWidget(model);
                                      }))),
                              Obx(() => Container(
                                  height: getVerticalSize(6.00),
                                  margin:
                                      getMargin(left: 20, top: 10, right: 20),
                                  child: AnimatedSmoothIndicator(
                                      activeIndex: controller.silderIndex.value,
                                      count: controller.onboardingModelObj.value
                                          .slideshowItemList.length,
                                      axisDirection: Axis.horizontal,
                                      effect: ScrollingDotsEffect(
                                          spacing: 6,
                                          activeDotColor:
                                              ColorConstant.whiteA700,
                                          dotColor: ColorConstant.whiteA70024,
                                          dotHeight: getVerticalSize(6.00),
                                          dotWidth: getHorizontalSize(6.00))))),
                              Container(
                                  width: getHorizontalSize(313.00),
                                  margin:
                                      getMargin(left: 20, top: 26, right: 20),
                                  child: Text("msg_your_content_ma".tr,
                                      maxLines: null,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtPoppinsSemiBold30
                                          .copyWith(height: 1.40))),
                              Padding(
                                  padding:
                                      getPadding(left: 20, top: 23, right: 20),
                                  child: CommonImageView(
                                      svgPath: ImageConstant.imgDescriptioncl,
                                      height: getVerticalSize(48.00),
                                      width: getHorizontalSize(335.00))),
                              CustomButton(
                                  width: 294,
                                  text: "lbl_get_started".tr,
                                  margin: getMargin(
                                      left: 20, top: 13, right: 20, bottom: 20),
                                  variant: ButtonVariant.OutlineGreenA40040)
                            ]))))));
  }

  onTapOnboarding2() {
    Get.toNamed(AppRoutes.loginScreen);
  }
}
