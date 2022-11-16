import 'package:audio_manager/audio_manager.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/presentation/player_screen/controller/player_controller.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';

class MusicPlayerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayerController>(
        init: PlayerController(),
        builder: ((controller) => Container(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          left: 25, top: 10, right: 25, bottom: 10),
                      width: size.width,
                      child: Stack(children: [
                        Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 3,
                                width: 300,
                                color: Colors.white,
                              ),
                              CommonImageView(
                                  url: controller.audioManager.audioList.isEmpty
                                      ? null
                                      : controller
                                          .audioManager
                                          .audioList[controller.curIndex.value]
                                          .coverUrl,
                                  height: 275,
                                  width: double.infinity),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25, top: 20, right: 25),
                                  child: Text.rich(
                                      TextSpan(
                                          text: controller.audioManager
                                                  .audioList.isEmpty
                                              ? null
                                              : controller
                                                  .audioManager
                                                  .audioList[
                                                      controller.curIndex.value]
                                                  .title),
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyle.txtPoppinsMedium25)),
                              // Padding(
                              //     padding: EdgeInsets.only(
                              //         left: 25, top: 20, right: 25),
                              //     child: Text.rich(
                              //         TextSpan(
                              //             text: controller
                              //                 .song.value.artist?.name),
                              //         overflow: TextOverflow.ellipsis,
                              //         style:
                              //             AppStyle.txtPoppinsRegular14Gray500))
                            ])
                      ])),
                  Padding(
                      padding: EdgeInsets.only(left: 0, top: 0, right: 0),
                      child: SliderTheme(
                          data: SliderThemeData(
                              trackShape: RoundedRectSliderTrackShape(),
                              activeTrackColor: ColorConstant.greenA400,
                              inactiveTrackColor: ColorConstant.gray800,
                              thumbColor: ColorConstant.greenA400,
                              thumbShape: RoundSliderThumbShape()),
                          child: Slider(
                              value: controller.position.value.inMilliseconds
                                  .round()
                                  .toDouble(),
                              max: controller.duration.value.inMilliseconds
                                  .toDouble(),
                              onChanged: (newPosition) {
                                controller.audioManager.seekTo(Duration(
                                    milliseconds: newPosition.round()));
                              },
                              onChangeEnd: (value) {}))),
                  Padding(
                      padding: EdgeInsets.only(left: 25, top: 0, right: 25),
                      child: Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(_formatDuration(controller.position.value),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular12),
                                Text(_formatDuration(controller.duration.value),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular12Gray500)
                              ]))),
                  Padding(
                      padding: EdgeInsets.only(left: 25, top: 12, right: 25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomIconButton(
                                onTap: () => controller.audioManager
                                    .nextMode(playMode: PlayMode.shuffle),
                                shape: IconButtonShape.none,
                                height: 40,
                                width: 40,
                                variant: IconButtonVariant.none,
                                child: CommonImageView(
                                  svgPath: ImageConstant.imgCall,
                                )),
                            CustomIconButton(
                                onTap: () => controller.audioManager.previous(),
                                height: 36,
                                width: 36,
                                variant: IconButtonVariant.FillWhiteA70026,
                                shape: IconButtonShape.RoundedBorder18,
                                child: CommonImageView(
                                    svgPath: ImageConstant.imgRewind)),
                            SizedBox(
                                height: 65.0,
                                width: 65.0,
                                child: Stack(
                                  children: [
                                    if (controller.audioManager.isLoading)
                                      Center(
                                        child: SizedBox(
                                          height: 65.0,
                                          width: 65.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              ColorConstant.tealA700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    Center(
                                      child: SizedBox(
                                        height: 59,
                                        width: 59,
                                        child: Center(
                                          child: controller
                                                  .audioManager.isPlaying
                                              ? FloatingActionButton(
                                                  elevation: 10,
                                                  tooltip: "Pause",
                                                  backgroundColor:
                                                      ColorConstant.tealA400,
                                                  onPressed: () {
                                                    controller.audioManager
                                                        .playOrPause();
                                                  },
                                                  child: const Icon(
                                                    Icons.pause_rounded,
                                                    size: 40.0,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              : FloatingActionButton(
                                                  elevation: 10,
                                                  tooltip: "Play",
                                                  backgroundColor:
                                                      ColorConstant.tealA400,
                                                  onPressed: () => controller
                                                      .audioManager
                                                      .playOrPause(),
                                                  child: const Icon(
                                                    Icons.play_arrow_rounded,
                                                    size: 40.0,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            CustomIconButton(
                                onTap: () => controller.audioManager.next(),
                                height: 36,
                                width: 36,
                                variant: IconButtonVariant.FillWhiteA70026,
                                shape: IconButtonShape.RoundedBorder18,
                                child: CommonImageView(
                                    svgPath: ImageConstant.imgNext)),
                            IconButton(
                              onPressed: () => controller.setPlayMode(),
                              icon: getPlayModeIcon(
                                  controller.audioManager.playMode),
                            )
                          ])),
                ],
              ),
            )));
  }

  Widget getPlayModeIcon(PlayMode playMode) {
    switch (playMode) {
      case PlayMode.sequence:
        return Icon(
          Icons.repeat,
          color: ColorConstant.gray500,
        );
      case PlayMode.shuffle:
        return Icon(
          Icons.shuffle,
          color: ColorConstant.gray500,
        );
      case PlayMode.single:
        return Icon(
          Icons.repeat_one,
          color: ColorConstant.gray500,
        );
    }
  }

  String _formatDuration(Duration? d) {
    if (d == null) return "--:--";
    int minute = d.inMinutes;
    int second = (d.inSeconds > 60) ? (d.inSeconds % 60) : d.inSeconds;
    String format = ((minute < 10) ? "0$minute" : "$minute") +
        ":" +
        ((second < 10) ? "0$second" : "$second");
    return format;
  }
}
