import '../controller/homepage_controller.dart';
import '../models/artist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

// ignore: must_be_immutable
class ArtistItemWidget extends StatelessWidget {
  ArtistItemWidget(this.artistsItemModelObj);

  ArtistsItemModel artistsItemModelObj;

  var controller = Get.find<HomepageController>();

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
            imagePath: ImageConstant.imgAvatar49X66,
            height: 50,
            width: getHorizontalSize(
              66.00,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 10,
          ),
          child: Text(
            "lbl_njugush".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppStyle.txtPoppinsSemiBold7,
          ),
        ),
      ],
    );
  }
}
