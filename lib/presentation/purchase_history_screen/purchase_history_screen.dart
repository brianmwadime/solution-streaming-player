import 'package:solution_ke/data/models/orders/orders_response.dart';

import 'widgets/purchase_item_widget.dart';
import 'controller/purchase_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';

class PurchaseHistoryScreen extends GetWidget<PurchaseHistoryController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: CustomIconButton(
                  padding: IconButtonPadding.PaddingAll1,
                  height: 38,
                  width: 38,
                  alignment: Alignment.centerRight,
                  onTap: () {
                    onTapBtnBack();
                  },
                  child: CommonImageView(svgPath: ImageConstant.imgArrowleft)),
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text("msg_purchase_histor".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsMedium20),
              centerTitle: true,
            ),
            backgroundColor: ColorConstant.black900,
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  // Padding(
                  //     padding: EdgeInsets.only(
                  //         left: 20, top: 10, right: 20, bottom: 10),
                  //     child: Container(
                  //         margin: EdgeInsets.only(top: 20),
                  //         child: RichText(
                  //             text: TextSpan(children: [
                  //               TextSpan(
                  //                   text: "lbl_22nd_may".tr,
                  //                   style: TextStyle(
                  //                     color: ColorConstant.whiteA700,
                  //                     fontSize: 12,
                  //                     fontFamily: 'Poppins',
                  //                     fontWeight: FontWeight.w700,
                  //                   )),
                  //             ]),
                  //             textAlign: TextAlign.left))),
                  Obx(() => ListView.separated(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(20),
                      shrinkWrap: true,
                      separatorBuilder: ((context, index) => Divider(
                            height: 30,
                            color: Colors.white,
                          )),
                      itemCount:
                          controller.userOrders.value.data?.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        UserOrder order =
                            controller.userOrders.value.data!.data![index];
                        return PurchaseItemWidget(order);
                      }))
                ]))));
  }

  onTapBtnBack() {
    Get.back();
  }
}
