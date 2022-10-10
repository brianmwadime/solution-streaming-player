import 'package:flutter/material.dart';
import 'package:solution_ke/data/models/releases/releases_response.dart';
import 'package:solution_ke/data/models/song/song_response.dart';
import 'package:solution_ke/presentation/homepage_screen/widgets/album_item_widget.dart';
import 'package:solution_ke/presentation/homepage_screen/widgets/song_item_widget.dart';
import 'package:solution_ke/presentation/player_screen/controller/player_controller.dart';

import '../../../core/app_export.dart';

class NewReleaseItemWidget extends StatelessWidget {
  const NewReleaseItemWidget({super.key, required this.model});

  final Release model;

  @override
  Widget build(BuildContext context) {
    return model.type == "1"
        ? GestureDetector(
            onTap: (() => {
                  onTapSong([model.song!])
                }),
            child: ListSongItemWidget(model.song!))
        : GestureDetector(
            onTap: (() {
              goToAlbum(model.album);
            }),
            child: ListAlbumItemWidget(model.album!));
  }

  onTapSong(List<Song> songs) {
    Get.find<PlayerController>().updatePlaylist(songs);
    Get.toNamed(AppRoutes.playerScreen,
        arguments: {NavigationArgs.songs: songs});
  }

  goToAlbum(album) async {
    await Get.toNamed(AppRoutes.albumScreen,
        arguments: {NavigationArgs.album: album}, preventDuplicates: false);
  }
}
