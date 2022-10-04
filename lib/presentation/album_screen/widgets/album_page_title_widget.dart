import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

class AlbumPageTitle extends StatelessWidget {
  final String? artistName;
  final int? songCount;
  final String? year;
  const AlbumPageTitle(
      {Key? key,
      required this.artistName,
      required this.songCount,
      required this.year})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Text("lbl_hello".tr,
                      //     overflow: TextOverflow.ellipsis,
                      //     textAlign: TextAlign.left,
                      //     style: AppStyle.txtPoppinsMedium18
                      //         .copyWith(height: 1.00)),
                      Text.rich(TextSpan(text: artistName),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsMedium18)
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CommonImageView(
                          svgPath: ImageConstant.imgFile,
                          height: 16,
                          width: 16),
                      Padding(
                          padding: EdgeInsets.only(left: 6, top: 1, bottom: 2),
                          child: Text.rich(
                              TextSpan(text: songCount.toString(), children: [
                                TextSpan(text: " "),
                                TextSpan(text: "Tracks"),
                                TextSpan(text: " - "),
                                TextSpan(text: year)
                              ]),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium12WhiteA700))
                    ])
              ]),
          CommonImageView(
            svgPath: ImageConstant.imgButtondotsm,
            height: 2,
            width: 16,
          )
        ]);
  }
}
