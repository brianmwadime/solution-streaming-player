import 'package:audio_manager/audio_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:solution_ke/core/utils/audio_song_converter.dart';
import 'package:solution_ke/presentation/my_world_screen/widgets/world_item_widget.dart';
import 'package:solution_ke/presentation/player_screen/controller/player_controller.dart';
import 'package:solution_ke/widgets/common_section_header.dart';

import 'controller/my_world_controller.dart';

import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';

import 'widgets/playlist_item_widget.dart';
import 'widgets/recent_item_widget.dart';

class MyWorldScreen extends GetWidget<MyWorldController> {
  @override
  Widget build(BuildContext context) {
    // Hive.box('cache').put('recentSongs', []);
    List recentList =
        Hive.box('cache').get('recentSongs', defaultValue: []) as List;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: Text("lbl_my_world".tr,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.txtPoppinsMedium20),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          actions: [
            // CustomIconButton(
            //     padding: IconButtonPadding.PaddingAll1,
            //     height: 38,
            //     width: 38,
            //     alignment: Alignment.centerRight,
            //     variant: IconButtonVariant.OutlineBlack9001a,
            //     child: CommonImageView(svgPath: ImageConstant.imgSearch)),
            // SizedBox(
            //   width: 20,
            // )
          ]),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            if (recentList.isNotEmpty)
              SectionHeaderWidget(title: "lbl_recent".tr, onTapMore: () {}),
            if (recentList.isNotEmpty)
              Container(
                  height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: double.infinity,
                  child: ListView.separated(
                      itemCount: recentList.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(
                            width: 20,
                          ),
                      itemBuilder: ((context, index) => GestureDetector(
                            child: RecentItemWidget(
                              song: recentList[index],
                            ),
                            onTap: () => onTapSong(recentList[index]),
                          )))),

            SectionHeaderWidget(
                title: "playlists".tr,
                onTapMore: () {
                  Get.toNamed(AppRoutes.playlistsScreen);
                }),

            Container(
                height: 140,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                child: Obx(() => ListView.separated(
                    itemCount: controller.playlists.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(
                          width: 20,
                        ),
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: (() {
                          Get.toNamed(AppRoutes.songsScreen, arguments: {
                            NavigationArgs.pageType: 1,
                            NavigationArgs.pageTitle:
                                controller.playlists[index].name,
                            NavigationArgs.typeId:
                                controller.playlists[index].id
                          });
                        }),
                        child: PlaylistItemWidget(
                            playlist: controller.playlists[index]),
                      );
                    })))),

            if (controller.purchased.isNotEmpty)
              SectionHeaderWidget(
                  title: "msg_purchased_conte".tr, onTapMore: () {}),
            if (controller.purchased.isNotEmpty)
              Container(
                  height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: double.infinity,
                  child: ListView.separated(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(
                            width: 20,
                          ),
                      itemBuilder: ((context, index) => WorldItemWidget()))),
            // SectionHeaderWidget(title: "lbl_my_world2".tr, onTapMore: () {}),
            // Container(
            //     height: 200,
            //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //     width: double.infinity,
            //     child: ListView.separated(
            //         itemCount: 5,
            //         scrollDirection: Axis.horizontal,
            //         separatorBuilder: (context, index) => SizedBox(
            //               width: 20,
            //             ),
            //         itemBuilder: ((context, index) => WorldItemWidget()))),
          ])),
    ));
  }

  onTapAlbum(albumId) {
    Get.toNamed(AppRoutes.albumScreen,
        arguments: {NavigationArgs.albumId: albumId});
  }

  onTapSong(Map song) {
    Get.find<PlayerController>()
        .updateRecentPlaylist([AudioInfoConverter.mapToAudioInfo(song)]);
    Get.toNamed(AppRoutes.playerScreen);
  }
}
