import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/data/models/genres/genre_list_response.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key, required this.model});

  final Genre model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstant.deepOrange500,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text.rich(
          TextSpan(text: model.name),
          style: AppStyle.txtPoppinsMedium14White,
        ),
      ),
    );
  }
}
