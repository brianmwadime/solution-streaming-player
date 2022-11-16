import 'package:solution_ke/data/models/album/album_response.dart';
import 'package:solution_ke/data/models/releases/releases_response.dart';
import 'package:solution_ke/data/models/song/song_response.dart';
import 'package:solution_ke/presentation/album_screen/controller/album_controller.dart';
import 'package:solution_ke/presentation/homepage_screen/widgets/releases_item_widget.dart';
import 'package:solution_ke/presentation/player_screen/controller/player_controller.dart';
import 'package:solution_ke/widgets/custom_miniplayer.dart';

import 'controller/release_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';

class ReleaseScreen extends GetWidget<ReleaseController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Scaffold(
              appBar: AppBar(
                leading: CustomIconButton(
                    padding: IconButtonPadding.PaddingAll1,
                    height: 38,
                    width: 38,
                    alignment: Alignment.centerRight,
                    onTap: () => Get.back(),
                    child:
                        CommonImageView(svgPath: ImageConstant.imgArrowleft)),
                elevation: 0,
                title: Text("New Releases",
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.txtPoppinsMedium18),
                centerTitle: true,
                backgroundColor: ColorConstant.black900,
              ),
              backgroundColor: ColorConstant.black900,
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // if (controller.pageType.value == 1)
                    //   PlaylistHead(
                    //     songsList: controller.songs,
                    //     offline: false,
                    //     fromDownloads: false,
                    //   ),
                    const SizedBox(height: 5),
                    Obx(() => GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(20),
                          shrinkWrap: true,
                          itemCount: controller.list.length,
                          itemBuilder: ((context, index) {
                            Release release = controller.list[index];
                            return GestureDetector(
                                onTap: () {
                                  if (release.type == "1") {
                                    onTapSong([release.song!]);
                                  } else {
                                    goToAlbumScreen(release.album!);
                                  }
                                },
                                child: NewReleaseItemWidget(
                                  model: release,
                                ));
                          }),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 250,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 20),
                        ))
                  ],
                ),
              )),
        ),
        MiniPlayer()
      ],
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
