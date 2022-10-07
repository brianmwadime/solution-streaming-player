import 'package:audio_manager/audio_manager.dart';
import 'package:solution_ke/core/utils/player_utils.dart';

import '/core/app_export.dart';
import 'package:solution_ke/data/models/song/song_response.dart';

class PlayerController extends GetxController {
  RxList<Song> songs = <Song>[].obs;

  final AudioManager audioManager = AudioManager.instance;

  Rx<bool> isPlaying = false.obs;
  Rx<Duration> duration = Duration(seconds: 0).obs;
  Rx<Duration> position = Duration(seconds: 0).obs;
  Rx<double> slider = 0.0.obs;
  Rx<String?>? error;
  Rx<int> curIndex = 0.obs;
  Rx<PlayMode> playMode = PlayMode.sequence.obs;

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      songs.value = Get.arguments[NavigationArgs.songs];
      audioManager.audioList = songs
          .map((e) => AudioInfo(e.filePath!,
              title: e.name!,
              desc: e.name!,
              coverUrl: e.artwork ?? "assets/images/cover.jpg"))
          .toList();
    }
  }

  @override
  void onReady() {
    super.onReady();

    setupAudio();
  }

  @override
  void onClose() {
    AudioManager.instance.release();
    super.onClose();
  }

  updatePlaylist(List<Song> songs) {
    audioManager.stop();
    audioManager.audioList = songs
        .map((e) => AudioInfo(e.filePath!,
            title: e.name!,
            desc: e.name!,
            coverUrl: e.artwork ?? "assets/images/cover.jpg"))
        .toList();

    audioManager.intercepter = true;
    audioManager.play(auto: true);
    update();
  }

  updateRecentPlaylist(List<AudioInfo> songs) {
    audioManager.stop();
    audioManager.audioList = songs;

    audioManager.intercepter = true;
    audioManager.play(auto: true);
    update();
  }

  setupAudio() {
    audioManager.onEvents((events, args) {
      print("$events, $args");
      switch (events) {
        case AudioManagerEvents.start:
          print(
              "start load data callback, curIndex is ${audioManager.curIndex}");
          position.value = audioManager.position;
          duration.value = audioManager.duration;

          curIndex.value = audioManager.curIndex;
          update();

          audioManager.updateLrc("audio resource loading....");
          break;
        case AudioManagerEvents.ready:
          print("ready to play");
          error?.value = null;
          position.value = audioManager.position;
          duration.value = audioManager.duration;
          // if you need to seek times, must after AudioManagerEvents.ready event invoked
          // audioManager.seekTo(Duration(seconds: 10));
          update();
          break;
        case AudioManagerEvents.seekComplete:
          position.value = audioManager.position;

          update();
          print("seek event is completed. position is [$args]/ms");
          break;
        case AudioManagerEvents.buffering:
          print("buffering $args");

          break;
        case AudioManagerEvents.playstatus:
          isPlaying.value = audioManager.isPlaying;
          if (isPlaying.value) {
            addRecentlyPlayed(audioManager.audioList[curIndex.value]);
          }
          update();
          break;
        case AudioManagerEvents.timeupdate:
          position.value = audioManager.position;

          update();

          audioManager.updateLrc(args["position"].toString());
          break;
        case AudioManagerEvents.error:
          error?.value = args;
          update();
          break;
        case AudioManagerEvents.ended:
          audioManager.next();
          break;
        case AudioManagerEvents.volumeChange:
          break;
        case AudioManagerEvents.next:
        case AudioManagerEvents.previous:
          curIndex.value = audioManager.curIndex;
          update();
          break;
        case AudioManagerEvents.stop:
          update();
          break;
        default:
          break;
      }
    });
  }

  void setPlayMode() {
    audioManager.nextMode();
    this.playMode.value = audioManager.playMode;
    update();
  }
}
