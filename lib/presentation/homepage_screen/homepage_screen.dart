import 'package:solution_ke/data/models/album/album_response.dart';
import 'package:solution_ke/data/models/releases/releases_response.dart';
import 'package:solution_ke/data/models/song/song_response.dart';
import 'package:solution_ke/data/models/updateProfile/profile_response.dart';
import 'package:solution_ke/presentation/player_screen/controller/player_controller.dart';
import 'package:solution_ke/widgets/common_section_header.dart';

import 'widgets/artist_item_widget.dart';
import 'widgets/album_item_widget.dart';
import 'widgets/releases_item_widget.dart';
import 'widgets/song_item_widget.dart';
import 'widgets/pill_item_item_widget.dart';
import 'controller/homepage_controller.dart';
import 'models/genre_item_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';
import 'package:solution_ke/widgets/custom_search_view.dart';

class HomepageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<HomepageController>(
      init: HomepageController(),
      builder: (controller) => Scaffold(
          extendBodyBehindAppBar: false,
          appBar: AppBar(
            leading: CustomIconButton(
                shape: IconButtonShape.RoundedBorder13,
                padding: IconButtonPadding.none,
                height: 40,
                width: 40,
                alignment: Alignment.centerRight,
                variant: IconButtonVariant.none,
                onTap: () {
                  onTapAccount();
                },
                child: CommonImageView(imagePath: ImageConstant.imgIntersect)),
            backgroundColor: Colors.transparent,
            actions: [
              CustomIconButton(
                  padding: IconButtonPadding.PaddingAll1,
                  height: 38,
                  width: 38,
                  alignment: Alignment.centerLeft,
                  variant: IconButtonVariant.OutlineBlack9001a,
                  child:
                      CommonImageView(svgPath: ImageConstant.imgNotification)),
              SizedBox(
                width: 20,
              ),
            ],
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text.rich(
                                TextSpan(
                                    text: Get.find<PrefUtils>().getUsername()),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                                style: AppStyle.txtPoppinsMedium25)),
                        Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 10, right: 20),
                            child: Text("msg_what_do_you_wan".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    AppStyle.txtPoppinsRegular14WhiteA70087)),
                        GestureDetector(
                          child: CustomSearchView(
                              width: double.infinity,
                              hintText: "msg_search_favourit".tr,
                              margin:
                                  EdgeInsets.only(left: 20, top: 23, right: 20),
                              alignment: Alignment.center,
                              prefix: Container(
                                  margin: EdgeInsets.only(
                                      left: 20, top: 10, right: 10, bottom: 10),
                                  child: CommonImageView(
                                      svgPath: ImageConstant.imgSearch)),
                              prefixConstraints:
                                  BoxConstraints(minWidth: 24, minHeight: 24),
                              // suffix: Padding(
                              //     padding: EdgeInsets.only(right: 15),
                              //     child: IconButton(
                              //         onPressed:
                              //             controller.searchBarSearController.clear,
                              //         icon: Icon(Icons.clear,
                              //             color: Colors.grey.shade600))),
                              suffixConstraints:
                                  BoxConstraints(minWidth: 16, minHeight: 16)),
                        ),
                        Divider(
                          color: ColorConstant.whiteA70026,
                          height: 40,
                        ),
                        if (controller
                                .homepageModelObj.value.trendingSongs.length >
                            0)
                          SectionHeaderWidget(
                              title: "lbl_trending_songs".tr,
                              onTapMore: () {
                                Get.toNamed(AppRoutes.songsScreen, arguments: {
                                  NavigationArgs.pageType: 3,
                                  NavigationArgs.pageTitle: "Trending Songs",
                                });
                              }),
                        if (controller
                                .homepageModelObj.value.trendingSongs.length >
                            0)
                          Container(
                              height: 230,
                              width: double.infinity,
                              child: Obx(() => ListView.separated(
                                  padding: EdgeInsets.only(
                                      left: 18, top: 22, right: 18),
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: controller.homepageModelObj.value
                                      .trendingSongs.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: 20,
                                      ),
                                  itemBuilder: (context, index) {
                                    Song model = controller.homepageModelObj
                                        .value.trendingSongs[index];
                                    return InkWell(
                                        child: ListSongItemWidget(model),
                                        onTap: () => onTapSong([model]));
                                  }))),
                        SectionHeaderWidget(
                            title: "lbl_popular_albums".tr,
                            onTapMore: () {
                              goToPopularAlbums();
                            }),
                        Container(
                            height: 230,
                            width: double.infinity,
                            child: Obx(() => ListView.separated(
                                padding: EdgeInsets.only(
                                    left: 18, top: 22, right: 17),
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        SizedBox(
                                          width: 20,
                                        ),
                                itemCount: controller.homepageModelObj.value
                                    .albumsItemList.length,
                                itemBuilder: (context, index) {
                                  Album model = controller.homepageModelObj
                                      .value.albumsItemList[index];
                                  return InkWell(
                                      child: ListAlbumItemWidget(model),
                                      onTap: () => goToAlbum(model));
                                }))),
                        SectionHeaderWidget(
                            title: "lbl_new_releases".tr,
                            onTapMore: () {
                              Get.toNamed(AppRoutes.releasesScreen);
                            }),
                        Container(
                            height: 230,
                            width: double.infinity,
                            child: Obx(() => ListView.separated(
                                padding:
                                    getPadding(left: 18, top: 22, right: 16),
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemCount: controller
                                    .homepageModelObj.value.releasesList.length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        SizedBox(
                                          width: 20,
                                        ),
                                itemBuilder: (context, index) {
                                  Release model = controller.homepageModelObj
                                      .value.releasesList[index];
                                  return NewReleaseItemWidget(
                                    model: model,
                                  );
                                }))),

                        Divider(
                          color: ColorConstant.whiteA70026,
                          height: 40,
                        ),
                        SectionHeaderWidget(
                            title: "msg_creatives_artis".tr,
                            hideActions: true,
                            onTapMore: () {}),
                        Container(
                            height: 170,
                            width: double.infinity,
                            child: Obx(() => ListView.separated(
                                padding: EdgeInsets.only(
                                    left: 20, top: 20, right: 20),
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemCount: controller.homepageModelObj.value
                                    .artistsItemList.length,
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 20,
                                    ),
                                itemBuilder: (context, index) {
                                  UserProfile model = controller
                                      .homepageModelObj
                                      .value
                                      .artistsItemList[index];
                                  return GestureDetector(
                                      onTap: (() {
                                        Get.toNamed(AppRoutes.songsScreen,
                                            arguments: {
                                              NavigationArgs.pageType: 4,
                                              NavigationArgs.pageTitle:
                                                  controller
                                                      .homepageModelObj
                                                      .value
                                                      .artistsItemList[index]
                                                      .name,
                                              NavigationArgs.typeId: controller
                                                  .homepageModelObj
                                                  .value
                                                  .artistsItemList[index]
                                                  .id
                                            });
                                      }),
                                      child: ArtistItemWidget(model));
                                }))),
                        SectionHeaderWidget(
                            title: "lbl_categories".tr,
                            onTapMore: () {
                              goToCategories();
                            }),
                        Container(
                            height: 50,
                            width: double.infinity,
                            margin:
                                EdgeInsets.only(left: 20, top: 10, right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.00)),
                            child: Obx(() => ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: controller.homepageModelObj.value
                                      .categoryItemsList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    GenreItemModel model = controller
                                        .homepageModelObj
                                        .value
                                        .categoryItemsList[index];
                                    return GestureDetector(
                                        onTap: () => Get.toNamed(
                                                AppRoutes.songsScreen,
                                                arguments: {
                                                  NavigationArgs.typeId:
                                                      model.id,
                                                  NavigationArgs.pageType: 2,
                                                  NavigationArgs.pageTitle:
                                                      model.name
                                                }),
                                        child: GenrePillItemItemWidget(model));
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          SizedBox(
                                    width: 20,
                                  ),
                                ))),
                        // Container(
                        //     height: 200,
                        //     width: double.infinity,
                        //     child: Obx(() => ListView.separated(
                        //         padding:
                        //             EdgeInsets.only(left: 20, top: 20, right: 20),
                        //         scrollDirection: Axis.horizontal,
                        //         physics: BouncingScrollPhysics(),
                        //         itemCount: controller.homepageModelObj.value
                        //             .categorySoundtemList.length,
                        //         separatorBuilder:
                        //             (BuildContext context, int index) => SizedBox(
                        //                   width: 20,
                        //                 ),
                        //         itemBuilder: (context, index) {
                        //           SoundLevelItemModel model = controller
                        //               .homepageModelObj
                        //               .value
                        //               .categorySoundtemList[index];
                        //           return SoundLevelItemWidget(model);
                        //         })))
                      ])))),
    ));
  }

  onTapSong(List<Song> songs) {
    Get.find<PlayerController>().updatePlaylist(songs);
    Get.toNamed(AppRoutes.playerScreen,
        arguments: {NavigationArgs.songs: songs});
  }

  goToAlbum(album) async {
    await Get.toNamed(AppRoutes.albumScreen,
        arguments: {NavigationArgs.album: album}, preventDuplicates: false);
  }

  goToCategories() async {
    await Get.toNamed(AppRoutes.categoriesScreen);
  }

  goToPopularAlbums() async {
    await Get.toNamed(AppRoutes.albumsScreen, arguments: {
      NavigationArgs.pageTitle: "Popular Albums",
      NavigationArgs.pageType: 0
    });
  }

  onTapAccount() {
    Get.toNamed(AppRoutes.accountScreen);
  }
}
