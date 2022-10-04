import '../controller/onboarding_artists_controller.dart';
import '../models/onboarding_category_item_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

// ignore: must_be_immutable
class Category1ItemWidget extends StatelessWidget {
  Category1ItemWidget(this.category1ItemModelObj);

  OnboardingArtistItemModel category1ItemModelObj;

  var controller = Get.find<OnboardingArtistsController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CommonImageView(
            imagePath: ImageConstant.imgAvatar,
            height: getVerticalSize(
              91.00,
            ),
            width: getHorizontalSize(
              93.00,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 19,
            top: 20,
            right: 18,
          ),
          child: Text(
            "lbl_lifestyle".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium14.copyWith(
              height: 1.00,
            ),
          ),
        ),
      ],
    );
  }
}
