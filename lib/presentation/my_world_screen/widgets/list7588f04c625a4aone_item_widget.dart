import '../controller/my_world_controller.dart';
import '../models/list7588f04c625a4aone_item_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

// ignore: must_be_immutable
class List7588f04c625a4aoneItemWidget extends StatelessWidget {
  List7588f04c625a4aoneItemWidget(this.list7588f04c625a4aoneItemModelObj);

  List7588f04c625a4aoneItemModel list7588f04c625a4aoneItemModelObj;

  var controller = Get.find<MyWorldController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Padding(
        padding: getPadding(
          right: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: getSize(
                138.00,
              ),
              width: getSize(
                138.00,
              ),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          2.00,
                        ),
                      ),
                      child: CommonImageView(
                        imagePath: ImageConstant.imgImageWhiteA700,
                        height: getSize(
                          138.00,
                        ),
                        width: getSize(
                          138.00,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: getSize(
                        148.00,
                      ),
                      width: getSize(
                        148.00,
                      ),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CommonImageView(
                              imagePath: ImageConstant.img7588f04c625a4a1,
                              height: getSize(
                                148.00,
                              ),
                              width: getSize(
                                148.00,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CommonImageView(
                              imagePath:
                                  ImageConstant.img7588f04c625a4a1148X148,
                              height: getSize(
                                148.00,
                              ),
                              width: getSize(
                                148.00,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                top: 16,
                right: 10,
                bottom: 16,
              ),
              child: Text(
                "lbl_wasamehe".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsMedium14.copyWith(
                  height: 1.00,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
