import '../controller/onboarding_two_controller.dart';
import '../models/slideshow1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

// ignore: must_be_immutable
class Slideshow1ItemWidget extends StatelessWidget {
  Slideshow1ItemWidget(this.slideshow1ItemModelObj);

  Slideshow1ItemModel slideshow1ItemModelObj;

  var controller = Get.find<OnboardingTwoController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
        top: 31,
        bottom: 25,
      ),
      child: CommonImageView(
        imagePath: ImageConstant.imageNotFound,
        height: getVerticalSize(
          322.00,
        ),
        width: getHorizontalSize(
          243.00,
        ),
      ),
    );
  }
}
