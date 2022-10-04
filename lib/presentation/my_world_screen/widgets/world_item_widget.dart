import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

class WorldItemWidget extends StatelessWidget {
  const WorldItemWidget({Key? key}) : super(key: key);

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
              CommonImageView(
                  imagePath: ImageConstant.imgIntersect138X138,
                  height: 150,
                  width: 150),
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
            TextSpan(text: "Recent"),
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        )
      ],
    );
  }
}
