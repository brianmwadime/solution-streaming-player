import 'package:solution_ke/presentation/my_world_screen/widgets/world_item_widget.dart';
import 'package:solution_ke/widgets/common_section_header.dart';

import 'controller/my_world_controller.dart';

import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';

class MyWorldScreen extends GetWidget<MyWorldController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: Text("lbl_my_world".tr,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.txtPoppinsMedium20),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          actions: [
            CustomIconButton(
                padding: IconButtonPadding.PaddingAll1,
                height: 38,
                width: 38,
                alignment: Alignment.centerRight,
                variant: IconButtonVariant.OutlineBlack9001a,
                child: CommonImageView(svgPath: ImageConstant.imgSearch)),
            SizedBox(
              width: 20,
            )
          ]),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            SectionHeaderWidget(title: "lbl_recent".tr, onTapMore: () {}),
            Container(
                height: 200,
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: ListView.separated(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(
                          width: 20,
                        ),
                    itemBuilder: ((context, index) => WorldItemWidget()))),
            SectionHeaderWidget(title: "lbl_playlist".tr, onTapMore: () {}),
            SectionHeaderWidget(
                title: "msg_purchased_conte".tr, onTapMore: () {}),
            Container(
                height: 200,
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: ListView.separated(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(
                          width: 20,
                        ),
                    itemBuilder: ((context, index) => WorldItemWidget()))),
            SectionHeaderWidget(title: "lbl_my_world2".tr, onTapMore: () {}),
            Container(
                height: 200,
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: ListView.separated(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(
                          width: 20,
                        ),
                    itemBuilder: ((context, index) => WorldItemWidget()))),
          ])),
    ));
  }

  onTapAlbum(albumId) {
    Get.toNamed(AppRoutes.albumScreen,
        arguments: {NavigationArgs.albumId: albumId});
  }
}
