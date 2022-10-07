import 'package:audio_manager/audio_manager.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/presentation/player_screen/controller/player_controller.dart';

class ControlButtons extends StatelessWidget {
  final AudioManager audioHandler;
  final bool shuffle;
  final bool miniplayer;
  final List buttons;
  final Color? dominantColor;

  const ControlButtons(
    this.audioHandler, {
    this.shuffle = false,
    this.miniplayer = false,
    this.buttons = const ['Previous', 'Play/Pause', 'Next'],
    this.dominantColor,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayerController>(
        init: PlayerController(),
        builder: ((controller) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: buttons.map<Widget>((e) {
                switch (e) {
                  case 'Previous':
                    return IconButton(
                      icon: const Icon(Icons.skip_previous_rounded),
                      iconSize: miniplayer ? 32.0 : 45.0,
                      tooltip: "Skip Previous",
                      color: dominantColor ?? Theme.of(context).iconTheme.color,
                      onPressed: () => audioHandler.previous(),
                    );
                  case 'Play/Pause':
                    return SizedBox(
                        height: miniplayer ? 40.0 : 65.0,
                        width: miniplayer ? 40.0 : 65.0,
                        child: Stack(
                          children: [
                            if (audioHandler.isLoading)
                              Center(
                                child: SizedBox(
                                  height: miniplayer ? 40.0 : 65.0,
                                  width: miniplayer ? 40.0 : 65.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).iconTheme.color!,
                                    ),
                                  ),
                                ),
                              ),
                            if (miniplayer)
                              Center(
                                child: controller.isPlaying.value
                                    ? IconButton(
                                        tooltip: "Pause",
                                        // iconSize: miniplayer ? 32.0 : 45.0,
                                        onPressed: () =>
                                            audioHandler.playOrPause(),
                                        icon: const Icon(
                                          Icons.pause_rounded,
                                        ),
                                        color:
                                            Theme.of(context).iconTheme.color,
                                      )
                                    : IconButton(
                                        tooltip: "Play Song",
                                        // iconSize: miniplayer ? 32.0 : 45.0,
                                        onPressed: () =>
                                            audioHandler.playOrPause(),
                                        icon: const Icon(
                                          Icons.play_arrow_rounded,
                                        ),
                                        color:
                                            Theme.of(context).iconTheme.color,
                                      ),
                              )
                            else
                              Center(
                                child: SizedBox(
                                  height: 59,
                                  width: 59,
                                  child: Center(
                                    child: controller.isPlaying.value
                                        ? FloatingActionButton(
                                            elevation: 10,
                                            tooltip: "Pause",
                                            backgroundColor: Colors.white,
                                            onPressed: () =>
                                                audioHandler.playOrPause(),
                                            child: const Icon(
                                              Icons.pause_rounded,
                                              size: 40.0,
                                              color: Colors.black,
                                            ),
                                          )
                                        : FloatingActionButton(
                                            elevation: 10,
                                            tooltip: "Play",
                                            backgroundColor: Colors.white,
                                            onPressed: () =>
                                                audioHandler.playOrPause(),
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
                        ));
                  case 'Next':
                    return IconButton(
                      icon: const Icon(Icons.skip_next_rounded),
                      iconSize: miniplayer ? 32.0 : 45.0,
                      tooltip: "Skip Next",
                      color: dominantColor ?? Theme.of(context).iconTheme.color,
                      onPressed: () => audioHandler.next(),
                    );
                  // case 'Download':
                  //   return !online
                  //       ? const SizedBox()
                  //       : DownloadButton(
                  //           size: 20.0,
                  //           icon: 'download',
                  //           data: MediaItemConverter.mediaItemToMap(mediaItem),
                  //         );
                  default:
                    break;
                }
                return const SizedBox();
              }).toList(),
            )));
  }
}
