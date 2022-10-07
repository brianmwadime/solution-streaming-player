import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/presentation/songs_screen/controller/songs_controller.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';
import 'package:solution_ke/widgets/custom_miniplayer.dart';

import 'widgets/song_tile_trailing_menu.dart';

class SongsScreen extends GetWidget<SongsController> {
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
                    const SizedBox(height: 5),
                    Obx(() => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.songs.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            leading: Card(
                              elevation: 5,
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: const Image(
                                  image: AssetImage(
                                    'assets/images/cover.jpg',
                                  ),
                                ),
                              ),
                            ),
                            title: Text.rich(
                              TextSpan(text: controller.songs[index].name),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              '${controller.songs[index].artist?.name ?? 'Unknown'} - ${controller.songs[index].album?.name ?? 'Unknown'}',
                              overflow: TextOverflow.ellipsis,
                              style: AppStyle.txtPoppinsMedium14WhiteA70099,
                            ),
                            trailing: SongTileTrailingMenu(
                              data: controller.songs[index].toJson(),
                              isPlaylist: false,
                              deleteLiked: (Map item) {
                                controller.deleteSong(item);
                              },
                            ),
                          );
                        })))
                  ],
                ),
              )),
        ),
        MiniPlayer()
      ],
    );
  }
}
