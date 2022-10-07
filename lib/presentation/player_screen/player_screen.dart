import 'package:solution_ke/widgets/common_add_playlist.dart';
import 'package:solution_ke/widgets/common_music_player.dart';

import 'controller/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_button.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';

class PlayerScreen extends GetWidget<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.down,
      background: const ColoredBox(color: Colors.transparent),
      key: const Key("PlayerScreen"),
      onDismissed: (direction) => {Get.back()},
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset(ImageConstant.background).image,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter),
          color: ColorConstant.black900,
        ),
        child: SafeArea(
            child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: false,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.expand_more_rounded),
              tooltip: "Back",
              onPressed: () => onTapBtnBack(),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.share_rounded),
                tooltip: "Share this song",
                onPressed: () {},
              ),
              CustomIconButton(
                padding: IconButtonPadding.PaddingAll1,
                height: 38,
                width: 38,
                alignment: Alignment.centerLeft,
                variant: IconButtonVariant.OutlineBlack9001a,
                child: CommonImageView(svgPath: ImageConstant.imgFavorite),
              ),
              SizedBox(width: 20)
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [MusicPlayerWidget()]))),
          bottomNavigationBar: SizedBox(
            height: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 1,
                    width: double.infinity,
                    decoration:
                        BoxDecoration(color: ColorConstant.whiteA70026)),
                Padding(
                    padding:
                        EdgeInsets.only(left: 25, right: 25, bottom: 8, top: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CommonImageView(
                              svgPath: ImageConstant.imgSort,
                              height: 20,
                              width: 20),
                          CustomButton(
                              width: 150,
                              text: "Add to Playlist",
                              variant: ButtonVariant.FillWhiteA7000f,
                              shape: ButtonShape.RoundedBorder22,
                              padding: ButtonPadding.PaddingAll11,
                              fontStyle: ButtonFontStyle.PoppinsMedium12,
                              onTap: () {
                                if (controller.audioManager.info == null)
                                  return;
                                var index = controller.audioManager.audioList
                                    .indexOf(controller.audioManager.info!);
                                AddToPlaylist().addToPlaylist(
                                    context, controller.songs[index].toJson());
                              })
                        ])),
              ],
            ),
          ),
        )),
      ),
    );
  }

  onTapBtnBack() {
    Get.back();
  }
}
