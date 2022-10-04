import 'package:solution_ke/data/models/album/album_response.dart';

import '../controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

// ignore: must_be_immutable
class ListAlbumItemWidget extends StatelessWidget {
  ListAlbumItemWidget(this.listavatItemModelObj);

  Album listavatItemModelObj;

  var controller = Get.find<HomepageController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 125,
          width: 155,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CommonImageView(
                url: listavatItemModelObj.artwork,
                imagePath: ImageConstant.imgAvatar116X156,
                height: 125,
                width: 155,
              ),
              Positioned(
                  width: 28,
                  height: 28,
                  bottom: -10,
                  right: 10,
                  child: Material(
                    color: Colors.tealAccent,
                    shape: CircleBorder(),
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Icon(
                        Icons.headset,
                        size: 18,
                      ),
                    ),
                  )),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(text: listavatItemModelObj.name),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsMedium14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CommonImageView(
                      svgPath: ImageConstant.imgFile,
                      height: 15,
                      width: 16,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 5,
                      ),
                      child: Text.rich(
                        TextSpan(
                            text: listavatItemModelObj.songCount.toString(),
                            children: [
                              TextSpan(text: " Tracks"),
                              TextSpan(text: " - "),
                              TextSpan(
                                  text: listavatItemModelObj.year.toString())
                            ]),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsMedium12Gray500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
