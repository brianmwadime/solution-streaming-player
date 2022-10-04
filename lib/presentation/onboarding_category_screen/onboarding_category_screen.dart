import '../onboarding_category_screen/widgets/category_item_widget.dart';
import 'controller/onboarding_category_controller.dart';
import 'models/category_item_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_button.dart';

class OnboardingCategoryScreen extends GetWidget<OnboardingCategoryController> {
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
                          onTapOnboardingcate();
                        },
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: getHorizontalSize(322.00),
                                  margin:
                                      getMargin(left: 27, top: 90, right: 26),
                                  child: Text("msg_select_your_fav".tr,
                                      maxLines: null,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtPoppinsSemiBold30
                                          .copyWith(height: 1.40))),
                              Padding(
                                  padding:
                                      getPadding(left: 27, top: 30, right: 27),
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
                                          .onboardingCategoryModelObj
                                          .value
                                          .categoryItemList
                                          .length,
                                      itemBuilder: (context, index) {
                                        OnboardingCategoryItemModel model =
                                            controller
                                                .onboardingCategoryModelObj
                                                .value
                                                .categoryItemList[index];
                                        return CategoryItemWidget(model);
                                      }))),
                              CustomButton(
                                  width: 294,
                                  text: "lbl_next".tr,
                                  margin:
                                      getMargin(left: 27, top: 91, right: 27),
                                  variant: ButtonVariant.OutlineGreenA40040_1),
                              Padding(
                                  padding: getPadding(
                                      left: 27, top: 23, right: 27, bottom: 20),
                                  child: Text("lbl_skip".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtPoppinsMedium14WhiteA70099
                                          .copyWith(height: 1.00)))
                            ]))))));
  }

  onTapOnboardingcate() {
    Get.toNamed(AppRoutes.onboardingArtistsScreen);
  }
}
