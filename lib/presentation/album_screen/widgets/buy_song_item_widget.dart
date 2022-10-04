import 'package:solution_ke/data/models/song/song_response.dart';

import '../controller/album_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_button.dart';

// ignore: must_be_immutable
class BuySongItemWidget extends StatelessWidget {
  BuySongItemWidget(this.song, {Key? key, this.onTapBtnBuy}) : super(key: key);

  final Song song;

  var controller = Get.find<AlbumController>();

  final VoidCallback? onTapBtnBuy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  bottom: 7,
                ),
                child: CommonImageView(
                  color: ColorConstant.gray500,
                  url: song.artwork,
                  // svgPath: song.artwork ?? "assets/noImage.svg",
                  height: 48,
                  width: 48,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(text: song.name),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsMedium14,
                    ),
                    Text.rich(
                      TextSpan(text: song.artist?.name ?? "N/a"),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsRegular12Gray500,
                    ),
                  ],
                ),
              ),
            ],
          ),
          CustomButton(
            width: 70,
            text: "lbl_buy".tr,
            shape: ButtonShape.RoundedBorder10,
            padding: ButtonPadding.PaddingAll6,
            fontStyle: ButtonFontStyle.PoppinsMedium13,
            onTap: onTapBtnBuy,
          ),
        ],
      ),
    );
  }
}
