import '../controller/homepage_controller.dart';
import '../models/genre_item_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

// ignore: must_be_immutable
class GenrePillItemItemWidget extends StatelessWidget {
  GenrePillItemItemWidget(this.genreItemModel);

  GenreItemModel genreItemModel;

  var controller = Get.find<HomepageController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.only(
          left: 10,
          top: 4,
          right: 10,
          bottom: 4,
        ),
        decoration: AppDecoration.txtFillGray501.copyWith(
          borderRadius: BorderRadiusStyle.txtRoundedBorder5,
        ),
        child: Text.rich(
          TextSpan(text: genreItemModel.name),
          overflow: TextOverflow.ellipsis,
          style: AppStyle.txtPoppinsSemiBold,
        ),
      ),
    );
  }
}
