import 'package:solution_ke/data/models/album/album_response.dart';
import 'package:solution_ke/widgets/custom_button.dart';

import '../controller/album_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

// ignore: must_be_immutable
class AlbumBuyMoreItemWidget extends StatelessWidget {
  AlbumBuyMoreItemWidget({Key? key, required this.album, this.onTapBuy})
      : super(key: key);

  final Album album;
  final VoidCallback? onTapBuy;

  var controller = Get.find<AlbumController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonImageView(
          url: album.artwork,
          height: 150,
          width: 150,
        ),
        Expanded(
          child: Container(
            width: 150,
            padding: EdgeInsets.only(
              top: 7,
              bottom: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(text: album.name),
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.txtPoppinsMedium14,
                  ),
                ),
                CustomButton(
                  width: 40,
                  text: "lbl_buy".tr,
                  shape: ButtonShape.RoundedBorder10,
                  padding: ButtonPadding.PaddingAll6,
                  fontStyle: ButtonFontStyle.PoppinsMedium13,
                  onTap: onTapBuy,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
