import 'package:audio_manager/audio_manager.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/utils/list_utils.dart';
import 'package:solution_ke/widgets/common_snackbar.dart';

void addToNowPlaying({
  required BuildContext context,
  required AudioInfo mediaItem,
  bool showNotification = true,
}) {
  final AudioManager audioHandler = AudioManager.instance;
  final AudioInfo? currentMediaItem = audioHandler.info;
  if (currentMediaItem != null &&
      currentMediaItem.url.toString().startsWith('http')) {
    if (audioHandler.audioList.contains(mediaItem) && showNotification) {
      ShowSnackBar().showSnackBar(
        context,
        "Already in Queue",
      );
    } else {
      audioHandler.audioList.add(mediaItem);

      if (showNotification) {
        ShowSnackBar().showSnackBar(
          context,
          "Added to Queue",
        );
      }
    }
  } else {
    if (showNotification) {
      ShowSnackBar().showSnackBar(
        context,
        currentMediaItem == null ? "Nothing is playing" : "Can't add to queue",
      );
    }
  }
}

void playNext(
  AudioInfo mediaItem,
  BuildContext context,
) {
  final AudioManager audioHandler = AudioManager.instance;
  final AudioInfo? currentMediaItem = audioHandler.info;
  if (currentMediaItem != null &&
      currentMediaItem.url.toString().startsWith('http')) {
    final queue = audioHandler.audioList;
    if (queue.contains(mediaItem)) {
      audioHandler.audioList.move(
        queue.indexOf(mediaItem),
        queue.indexOf(currentMediaItem) + 1,
      );
    } else {
      audioHandler.audioList.add(mediaItem);
      audioHandler.audioList
          .move(queue.length, queue.indexOf(currentMediaItem) + 1);
    }

    ShowSnackBar().showSnackBar(
      context,
      '"${mediaItem.title}" will play next.',
    );
  } else {
    ShowSnackBar().showSnackBar(
      context,
      currentMediaItem == null ? "Nothing is playing" : "Can't add to queue",
    );
  }
}
