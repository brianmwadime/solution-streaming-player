import '../controller/album_details_controller.dart';
import '../models/song_item_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

// ignore: must_be_immutable
class SongslistItemWidget extends StatelessWidget {
  SongslistItemWidget(this.songslistItemModelObj);

  SongItemModel songslistItemModelObj;

  var controller = Get.find<AlbumDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: getPadding(
              top: 10,
              bottom: 3,
            ),
            child: CommonImageView(
              imagePath: ImageConstant.imgSongart,
              height: getSize(
                45.00,
              ),
              width: getSize(
                45.00,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 14,
              top: 16,
              bottom: 6,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: getHorizontalSize(
                    242.00,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: getPadding(
                          bottom: 8,
                        ),
                        child: Text(
                          "msg_young_and_stupi".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsMedium14.copyWith(
                            height: 1.00,
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 11,
                        ),
                        child: Text(
                          "lbl_03_30".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsRegular12Gray500.copyWith(
                            height: 1.00,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 1,
                    right: 10,
                  ),
                  child: Text(
                    "lbl_mamas_love".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular12Gray500.copyWith(
                      height: 1.00,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 8,
              top: 32,
              bottom: 24,
            ),
            child: CommonImageView(
              svgPath: ImageConstant.imgButtondotsm,
              height: getVerticalSize(
                2.00,
              ),
              width: getHorizontalSize(
                16.00,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
