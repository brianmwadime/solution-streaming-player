import 'package:solution_ke/data/models/orders/orders_response.dart';

import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

// ignore: must_be_immutable
class PurchaseItemWidget extends StatelessWidget {
  PurchaseItemWidget(this.order);

  UserOrder order;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            CommonImageView(
              svgPath: ImageConstant.imgCheckmark23X23,
              height: 24,
              width: 24,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "lbl_tukusifu_album".tr,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.txtPoppinsMedium14White,
                      ),
                      Text(
                        "lbl_guardian_angel".tr,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.txtPoppinsRegular12White,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        Text.rich(
          TextSpan(text: order.finalPrice),
          overflow: TextOverflow.ellipsis,
          style: AppStyle.txtPoppinsRegular12,
        ),
      ],
    );
  }
}
