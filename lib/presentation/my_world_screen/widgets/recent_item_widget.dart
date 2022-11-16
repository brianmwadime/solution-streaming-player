import 'package:audio_manager/audio_manager.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

class RecentItemWidget extends StatelessWidget {
  const RecentItemWidget({Key? key, required this.song}) : super(key: key);

  final Map song;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 150,
            width: 150,
            child: Stack(clipBehavior: Clip.none, children: [
              CommonImageView(url: song["coverUrl"], height: 150, width: 150),
              Positioned(
                  width: 28,
                  height: 28,
                  bottom: -10,
                  right: -10,
                  child: Material(
                    color: Colors.tealAccent,
                    shape: CircleBorder(),
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  )),
            ])),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text.rich(
            TextSpan(text: song["title"]),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        )
      ],
    );
  }
}
