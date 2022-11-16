import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:solution_ke/data/models/song/song_response.dart';
import 'package:solution_ke/presentation/player_screen/controller/player_controller.dart';
import 'package:solution_ke/presentation/player_screen/player_screen.dart';
import 'package:solution_ke/routes/navigation_args.dart';

import '../routes/app_routes.dart';

class PlaylistHead extends StatelessWidget {
  final List<Song> songsList;
  final bool offline;
  final bool fromDownloads;
  const PlaylistHead({
    super.key,
    required this.songsList,
    required this.fromDownloads,
    required this.offline,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 20.0, right: 10.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${songsList.length} ${"lbl_songs".tr}',
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: () {
              final tempList = songsList.toList();
              tempList.shuffle();

              onTapSong(tempList);
              // Navigator.of(context).push(
              //   PageRouteBuilder(
              //     opaque: false,
              //     pageBuilder: (_, __, ___) => PlayerScreen(
              //       songsList: tempList,
              //       index: 0,
              //       offline: offline,
              //       fromMiniplayer: false,
              //       fromDownloads: fromDownloads,
              //       recommend: false,
              //     ),
              //   ),
              // );
            },
            icon: const Icon(Icons.shuffle_rounded, color: Colors.white),
            label: Text(
              "Shuffle",
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: () {
              onTapSong(songsList);
              // Navigator.of(context).push(
              //   PageRouteBuilder(
              //     opaque: false,
              //     pageBuilder: (_, __, ___) => PlayScreen(
              //       songsList: songsList,
              //       index: 0,
              //       offline: offline,
              //       fromMiniplayer: false,
              //       fromDownloads: fromDownloads,
              //       recommend: false,
              //     ),
              //   ),
              // );
            },
            tooltip: "Shuffle songs",
            color: Colors.white,
            icon: const Icon(Icons.play_arrow_rounded),
            iconSize: 30.0,
          ),
        ],
      ),
    );
  }

  onTapSong(List<Song> songs) {
    Get.find<PlayerController>().updatePlaylist(songs);
    Get.toNamed(AppRoutes.playerScreen,
        arguments: {NavigationArgs.songs: songs});
  }
}
