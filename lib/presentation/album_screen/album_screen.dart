import 'package:solution_ke/data/models/album/album_response.dart';
import 'package:solution_ke/data/models/song/song_response.dart';
import 'package:solution_ke/presentation/player_screen/controller/player_controller.dart';
import 'package:solution_ke/widgets/common_section_header.dart';
import 'package:solution_ke/widgets/custom_miniplayer.dart';

import 'widgets/buy_more_item_widget.dart';
import 'widgets/buy_song_item_widget.dart';
import 'controller/album_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_button.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';

import 'widgets/album_page_title_widget.dart';

class AlbumScreen extends GetWidget<AlbumController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  leading: CustomIconButton(
                      padding: IconButtonPadding.PaddingAll1,
                      height: 38,
                      width: 38,
                      alignment: Alignment.centerRight,
                      onTap: () {
                        onTapBtnBack();
                      },
                      child:
                          CommonImageView(svgPath: ImageConstant.imgArrowleft)),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text("lbl_album".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsMedium18),
                  centerTitle: true,
                ),
                backgroundColor: ColorConstant.black900,
                body: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(children: [
                                Container(
                                    height: 300,
                                    width: size.width,
                                    child: Stack(
                                        clipBehavior: Clip.none,
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          Obx(() => CommonImageView(
                                              url: controller.albumModelObj
                                                  .value.album?.value.artwork,
                                              height: 300,
                                              width: double.infinity)),
                                          Container(
                                              height: double.infinity,
                                              width: double.infinity,
                                              decoration:
                                                  AppDecoration.fillBlack9008d,
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CustomIconButton(
                                                        height: 50,
                                                        width: 50,
                                                        variant:
                                                            IconButtonVariant
                                                                .FillTealA400,
                                                        shape: IconButtonShape
                                                            .CircleBorder25,
                                                        onTap: () {
                                                          onTapSong(controller
                                                              .albumModelObj
                                                              .value
                                                              .songsList);
                                                        },
                                                        child: CommonImageView(
                                                            svgPath: ImageConstant
                                                                .imgPath3464))
                                                  ])),
                                          Positioned(
                                            right: 30,
                                            bottom: -15,
                                            child: CustomButton(
                                                onTap: (() {
                                                  Album? album = controller
                                                      .albumModelObj
                                                      .value
                                                      .album
                                                      ?.value;
                                                  if (album != null) {
                                                    goToBuyScreen(album);
                                                  }
                                                }),
                                                width: 95,
                                                text: "lbl_buy".tr,
                                                shape:
                                                    ButtonShape.RoundedBorder10,
                                                padding:
                                                    ButtonPadding.PaddingAll6,
                                                fontStyle: ButtonFontStyle
                                                    .PoppinsMedium13,
                                                alignment:
                                                    Alignment.bottomRight),
                                          )
                                        ])),
                                Positioned(
                                  bottom: 20,
                                  right: 20,
                                  left: 20,
                                  child: Obx(() => AlbumPageTitle(
                                        artistName: controller.albumModelObj
                                            .value.album?.value.name,
                                        songCount: controller.albumModelObj
                                            .value.album?.value.songCount,
                                        year: controller.albumModelObj.value
                                            .album?.value.year,
                                      )),
                                ),
                              ]),
                              Container(
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: AppDecoration.fillBlack900,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25, right: 25),
                                            child: Text("lbl_songs".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsSemiBold18)),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 0, bottom: 20),
                                            child: Obx(() => ListView.separated(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                shrinkWrap: true,
                                                separatorBuilder:
                                                    (context, index) {
                                                  return Divider(
                                                      height: 20,
                                                      color: ColorConstant
                                                          .whiteA70026);
                                                },
                                                itemCount: controller
                                                    .albumModelObj
                                                    .value
                                                    .songsList
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  Song model = controller
                                                      .albumModelObj
                                                      .value
                                                      .songsList[index];
                                                  return InkWell(
                                                    onTap: (() =>
                                                        onTapSong([model])),
                                                    child: BuySongItemWidget(
                                                        model,
                                                        onTapBtnBuy: () =>
                                                            goToBuySongScreen(
                                                                model)),
                                                  );
                                                }))),
                                        Obx(() => SectionHeaderWidget(
                                            hideActions: true,
                                            title:
                                                "More by ${controller.albumModelObj.value.artist?.value.name ?? ""}",
                                            onTapMore: () {})),
                                        Container(
                                            height: 220,
                                            width: double.infinity,
                                            child: Obx(() => ListView.separated(
                                                padding: EdgeInsets.only(
                                                    top: 20,
                                                    right: 20,
                                                    left: 20),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                physics:
                                                    BouncingScrollPhysics(),
                                                itemCount: controller
                                                    .albumModelObj
                                                    .value
                                                    .moreByArtistList
                                                    .length,
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                itemBuilder: (context, index) {
                                                  Album model = controller
                                                      .albumModelObj
                                                      .value
                                                      .moreByArtistList[index];
                                                  return InkWell(
                                                    onTap: () =>
                                                        goToAlbumScreen(model),
                                                    child:
                                                        AlbumBuyMoreItemWidget(
                                                      album: model,
                                                      onTapBuy: () =>
                                                          goToBuyScreen(model),
                                                    ),
                                                  );
                                                })))
                                      ]))
                            ])))),
          ),
          MiniPlayer()
        ],
      ),
    );
  }

  onTapSong(List<Song> songs) {
    Get.find<PlayerController>().updatePlaylist(songs);
    Get.toNamed(AppRoutes.playerScreen,
        arguments: {NavigationArgs.songs: songs});
  }

  goToBuyScreen(Album album) {
    Get.toNamed(AppRoutes.purchaseScreen,
        arguments: {NavigationArgs.album: album});
  }

  goToBuySongScreen(Song song) {
    Get.toNamed(AppRoutes.purchaseScreen,
        arguments: {NavigationArgs.song: song});
  }

  onTapBtnBack() {
    Get.back();
  }

  goToAlbumScreen(Album album) async {
    AlbumController controller = Get.find<AlbumController>();
    controller.albumModelObj.value.album?.value = album;
    controller.albumModelObj.value.artist?.value = album.artist!;
    await Get.toNamed(AppRoutes.albumScreen,
        arguments: {NavigationArgs.album: album}, preventDuplicates: false);
  }
}
