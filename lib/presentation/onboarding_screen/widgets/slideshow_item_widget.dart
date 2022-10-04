import '../controller/onboarding_controller.dart';
import '../models/slideshow_item_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

// ignore: must_be_immutable
class SlideshowItemWidget extends StatelessWidget {
  SlideshowItemWidget(this.slideshowItemModelObj);

  SlideshowItemModel slideshowItemModelObj;

  var controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: getPadding(
            top: 31,
            bottom: 25,
          ),
          child: CommonImageView(
            imagePath: ImageConstant.imgSlideshow2,
            height: getVerticalSize(
              322.00,
            ),
            width: getHorizontalSize(
              243.00,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 19,
          ),
          child: CommonImageView(
            imagePath: ImageConstant.imgSlideshow2378X287,
            height: getVerticalSize(
              378.00,
            ),
            width: getHorizontalSize(
              287.00,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 19,
            top: 31,
            bottom: 25,
          ),
          child: CommonImageView(
            imagePath: ImageConstant.imgSlideshow1,
            height: getVerticalSize(
              322.00,
            ),
            width: getHorizontalSize(
              243.00,
            ),
          ),
        ),
      ],
    );
  }
}
