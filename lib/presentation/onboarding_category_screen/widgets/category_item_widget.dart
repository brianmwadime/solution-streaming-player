import '../controller/onboarding_category_controller.dart';
import '../models/category_item_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

// ignore: must_be_immutable
class CategoryItemWidget extends StatelessWidget {
  CategoryItemWidget(this.categoryItemModelObj);

  OnboardingCategoryItemModel categoryItemModelObj;

  var controller = Get.find<OnboardingCategoryController>();

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
            height: 90,
            width: 80,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 19,
            top: 20,
            right: 18,
          ),
          child: Obx(
            () => Text(
              categoryItemModelObj.labelTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsMedium14,
            ),
          ),
        ),
      ],
    );
  }
}
