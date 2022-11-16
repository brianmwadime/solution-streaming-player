import 'package:solution_ke/extensions/audio_info_extensions.dart';
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
            height: 64,
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
                                // var index = controller.audioManager.audioList
                                //     .indexOf(controller.audioManager.info!);
                                AddToPlaylist().addToPlaylist(context,
                                    controller.audioManager.info?.toJson());
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

// class MediaState {
//   final MediaItem? mediaItem;
//   final Duration position;

//   MediaState(this.mediaItem, this.position);
// }

// class PositionData {
//   final Duration position;
//   final Duration bufferedPosition;
//   final Duration duration;

//   PositionData(this.position, this.bufferedPosition, this.duration);
// }

// class QueueState {
//   static const QueueState empty =
//       QueueState([], 0, [], AudioServiceRepeatMode.none);

//   final List<MediaItem> queue;
//   final int? queueIndex;
//   final List<int>? shuffleIndices;
//   final AudioServiceRepeatMode repeatMode;

//   const QueueState(
//     this.queue,
//     this.queueIndex,
//     this.shuffleIndices,
//     this.repeatMode,
//   );

//   bool get hasPrevious =>
//       repeatMode != AudioServiceRepeatMode.none || (queueIndex ?? 0) > 0;
//   bool get hasNext =>
//       repeatMode != AudioServiceRepeatMode.none ||
//       (queueIndex ?? 0) + 1 < queue.length;

//   List<int> get indices =>
//       shuffleIndices ?? List.generate(queue.length, (i) => i);
// }

// abstract class AudioPlayerHandler implements AudioHandler {
//   Stream<QueueState> get queueState;
//   Future<void> moveQueueItem(int currentIndex, int newIndex);

//   Future<void> setVolume(double volume);
// }
