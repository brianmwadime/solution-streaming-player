import '../controller/homepage_controller.dart';
import '../models/soundlevel_item_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

// ignore: must_be_immutable
class SoundLevelItemWidget extends StatelessWidget {
  SoundLevelItemWidget(this.listsoundlevelItemModelObj);

  SoundLevelItemModel listsoundlevelItemModelObj;

  var controller = Get.find<HomepageController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        color: ColorConstant.deepPurple700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Container(
          height: 140,
          width: 150,
          decoration: AppDecoration.fillDeeppurple700.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 5,
                right: 8,
                left: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("lbl_gospel".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsSemiBold15),
                    CommonImageView(
                      svgPath: ImageConstant.imgSoundlevel,
                      height: 10,
                      width: 24,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
