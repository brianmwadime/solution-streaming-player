import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/presentation/player_screen/controller/player_controller.dart';
import 'package:solution_ke/widgets/custom_gradient_containers.dart';
import 'package:solution_ke/widgets/custom_miniplayer_controls.dart';

class MiniPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayerController>(
        init: PlayerController(),
        builder: ((controller) => (controller.isPlaying.value ||
                controller.audioManager.audioList.isNotEmpty)
            ? Dismissible(
                key: const Key('miniplayer'),
                direction: DismissDirection.down,
                onDismissed: (_) {
                  Feedback.forLongPress(context);
                  controller.audioManager.stop();
                },
                child: Dismissible(
                  key: Key(controller.audioManager
                      .audioList[controller.curIndex.value].hashCode
                      .toString()),
                  confirmDismiss: ((direction) {
                    if (direction == DismissDirection.startToEnd) {
                      controller.audioManager.previous();
                    } else {
                      controller.audioManager.next();
                    }
                    return Future.value(false);
                  }),
                  child: Column(children: [
                    SliderTheme(
                        data: SliderThemeData(
                          trackShape: RoundedRectSliderTrackShape(),
                          trackHeight: 0.5,
                          activeTrackColor: ColorConstant.greenA400,
                          inactiveTrackColor: ColorConstant.gray800,
                          thumbColor: ColorConstant.greenA400,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 1.0,
                          ),
                          overlayColor: Colors.transparent,
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 2.0,
                          ),
                        ),
                        child: Center(
                          child: Obx(() => Material(
                                color: Colors.white,
                                shadowColor: Colors.transparent,
                                shape: null,
                                elevation: 0,
                                child: Slider(
                                    inactiveColor: Colors.transparent,
                                    value: controller.slider.value,
                                    onChanged: (value) {
                                      controller.slider.value = value;
                                    },
                                    onChangeEnd: (value) {
                                      if (controller.duration.value != null) {
                                        Duration msec = Duration(
                                            milliseconds: (controller.duration
                                                        .value.inMilliseconds *
                                                    value)
                                                .round());
                                        controller.audioManager.seekTo(msec);
                                      }
                                    }),
                              )),
                        )),
                    Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 2.0,
                        vertical: 0.0,
                      ),
                      child: SizedBox(
                        height: 68,
                        child: GradientContainer(
                          opacity: true,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            ListTile(
                                dense: true,
                                onTap: () =>
                                    Get.toNamed(AppRoutes.playerScreen),
                                title: Text(
                                  controller
                                      .audioManager
                                      .audioList[controller.curIndex.value]
                                      .title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                  controller
                                      .audioManager
                                      .audioList[controller.curIndex.value]
                                      .desc,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                leading: Hero(
                                  tag: "currentArtwork",
                                  child: Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: SizedBox.square(
                                      dimension: 40.0,
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(controller
                                            .audioManager
                                            .audioList[
                                                controller.curIndex.value]
                                            .coverUrl),
                                      ),
                                    ),
                                  ),
                                ),
                                trailing: ControlButtons(
                                    controller.audioManager,
                                    miniplayer: true,
                                    buttons: ['Play/Pause', 'Next'])),
                          ]),
                        ),
                      ),
                    ),
                  ]),
                ))
            : SizedBox()));
  }
}
