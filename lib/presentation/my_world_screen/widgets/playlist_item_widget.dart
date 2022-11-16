import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/data/models/playlist/playlist_response.dart';

// ignore: must_be_immutable
class PlaylistItemWidget extends StatelessWidget {
  PlaylistItemWidget({Key? key, required this.playlist}) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: CommonImageView(
            url: playlist.artwork,
            imagePath: "assets/images/cover.jpg",
            height: 100,
            width: 100,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 10,
          ),
          child: Text.rich(
            TextSpan(text: playlist.name),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppStyle.txtPoppinsRegular14.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
