import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/data/models/album/album_response.dart';
import 'package:solution_ke/presentation/albums_screen/controller/albums_controller.dart';
import 'package:solution_ke/presentation/homepage_screen/widgets/album_item_widget.dart';
import 'package:solution_ke/widgets/common_playlist_head.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';
import 'package:solution_ke/widgets/custom_miniplayer.dart';

import 'widgets/song_tile_trailing_menu.dart';

class AlbumsScreen extends GetWidget<AlbumsController> {
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
                title: Text(controller.title.value,
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
                          itemCount: controller.albums.length,
                          itemBuilder: ((context, index) {
                            Album album = controller.albums[index];
                            return GestureDetector(
                                onTap: () {
                                  goToAlbum(album);
                                },
                                child: ListAlbumItemWidget(album));
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

  goToAlbum(album) async {
    await Get.toNamed(AppRoutes.albumScreen,
        arguments: {NavigationArgs.album: album}, preventDuplicates: false);
  }
}
