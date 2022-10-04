import '../controller/my_world_controller.dart';
import '../models/listavatar_eight_item_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ListavatarEightItemWidget extends StatelessWidget {
  ListavatarEightItemWidget(this.listavatarEightItemModelObj);

  ListavatarEightItemModel listavatarEightItemModelObj;

  var controller = Get.find<MyWorldController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: getPadding(
            right: 18,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: getVerticalSize(
                    147.00,
                  ),
                  width: getHorizontalSize(
                    152.00,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: getPadding(
                            right: 10,
                            bottom: 10,
                          ),
                          child: CommonImageView(
                            imagePath: ImageConstant.imgIntersect138X138,
                            height: getSize(
                              138.00,
                            ),
                            width: getSize(
                              138.00,
                            ),
                          ),
                        ),
                      ),
                      CustomIconButton(
                        height: 28,
                        width: 28,
                        margin: getMargin(
                          left: 10,
                          top: 10,
                        ),
                        alignment: Alignment.bottomRight,
                        child: CommonImageView(),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 1,
                  right: 10,
                  bottom: 20,
                ),
                child: Text(
                  "lbl_kuoshwa".tr,
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
      ),
    );
  }
}
