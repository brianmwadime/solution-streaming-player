import 'package:solution_ke/data/models/updateProfile/profile_response.dart';

import '../controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

// ignore: must_be_immutable
class ArtistItemWidget extends StatelessWidget {
  ArtistItemWidget(this.user);

  UserProfile user;

  var controller = Get.find<HomepageController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CommonImageView(
            url: user.avatar,
            imagePath: "assets/images/artist.png",
            height: 100,
            width: 100,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 10,
          ),
          child: Text.rich(
            TextSpan(text: user.name),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppStyle.txtPoppinsSemiBold15,
          ),
        ),
      ],
    );
  }
}
