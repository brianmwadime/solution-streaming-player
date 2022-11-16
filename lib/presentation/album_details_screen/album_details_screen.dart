import '../album_details_screen/widgets/songslist_item_widget.dart';
import 'controller/album_details_controller.dart';
import 'models/song_item_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';

class AlbumDetailsScreen extends GetWidget<AlbumDetailsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.black900,
            body: Container(
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                  Container(
                      margin: EdgeInsets.only(top: 23),
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                height: 480,
                                width: size.width,
                                margin: EdgeInsets.only(bottom: 10),
                                child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: CommonImageView(
                                              imagePath:
                                                  ImageConstant.imgFlare1,
                                              height: getVerticalSize(481.00),
                                              width:
                                                  getHorizontalSize(375.00))),
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                              width: size.width,
                                              margin: EdgeInsets.only(
                                                  left: 25,
                                                  top: 5,
                                                  right: 25,
                                                  bottom: 10),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    CustomIconButton(
                                                        height: 45,
                                                        width: 45,
                                                        margin: EdgeInsets.only(
                                                            top: 2),
                                                        variant: IconButtonVariant
                                                            .OutlineGreenA4001a,
                                                        onTap: () {
                                                          onTapBtntf();
                                                        },
                                                        child: CommonImageView(
                                                            svgPath: ImageConstant
                                                                .imgArrowleft)),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 17,
                                                                bottom: 9),
                                                        child: Text(
                                                            "lbl_my_world".tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsMedium20
                                                                .copyWith(
                                                                    height:
                                                                        1.00))),
                                                    CustomIconButton(
                                                        height: 45,
                                                        width: 45,
                                                        margin: getMargin(
                                                            bottom: 2),
                                                        variant: IconButtonVariant
                                                            .OutlineBlack9001a,
                                                        child: CommonImageView(
                                                            svgPath: ImageConstant
                                                                .imgFavorite))
                                                  ])))
                                    ]))),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 25, top: 10, right: 25),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CommonImageView(
                                          imagePath: ImageConstant.imgAlbumart,
                                          height: getSize(325.00),
                                          width: getSize(325.00)),
                                      Padding(
                                          padding:
                                              getPadding(top: 31, right: 10),
                                          child: Text("lbl_mkurugenzi".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtPoppinsMedium18
                                                  .copyWith(height: 1.00))),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 13, right: 10, bottom: 4),
                                          child: Text("msg_enjoy_all_the_m".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsRegular12WhiteA700b4
                                                  .copyWith(height: 1.00)))
                                    ])))
                      ])),
                  Container(
                      height: getVerticalSize(1.00),
                      width: size.width,
                      margin: getMargin(top: 15),
                      decoration:
                          BoxDecoration(color: ColorConstant.whiteA70026)),
                  Padding(
                      padding: getPadding(left: 25, top: 27, right: 25),
                      child: Text("msg_200_000_likes".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsRegular12
                              .copyWith(height: 1.00))),
                  Obx(() => ListView.builder(
                      padding: EdgeInsetsDirectional.only(
                          start: 25, top: 82, end: 24, bottom: 6),
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller
                          .albumDetailsModelObj.value.songslistItemList.length,
                      itemBuilder: (context, index) {
                        SongItemModel model = controller.albumDetailsModelObj
                            .value.songslistItemList[index];
                        return SongslistItemWidget(model);
                      }))
                ])))));
  }

  onTapAlbumDetails() {
    Get.toNamed(AppRoutes.purchaseScreen);
  }

  onTapBtntf() {
    Get.back();
  }
}
