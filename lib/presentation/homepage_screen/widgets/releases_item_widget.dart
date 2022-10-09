import 'package:flutter/material.dart';
import 'package:solution_ke/presentation/homepage_screen/widgets/album_item_widget.dart';
import 'package:solution_ke/presentation/homepage_screen/widgets/song_item_widget.dart';

class NewReleaseItemWidget extends StatelessWidget {
  const NewReleaseItemWidget({super.key, required this.model});

  final dynamic model;

  @override
  Widget build(BuildContext context) {
    return model["type"] == 1
        ? ListSongItemWidget(model["song"])
        : ListAlbumItemWidget(model["album"]);
  }
}
