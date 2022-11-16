import 'package:solution_ke/data/models/album/album_response.dart';
import 'package:solution_ke/data/models/song/song_response.dart';

import 'controller/purchase_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_button.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';
import 'package:solution_ke/widgets/custom_radio_button.dart';
import 'package:solution_ke/widgets/custom_text_form_field.dart';

class PurchaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<PurchaseController>(
            init: PurchaseController(),
            builder: (controller) => Scaffold(
                appBar: AppBar(
                  leading: CustomIconButton(
                      padding: IconButtonPadding.PaddingAll1,
                      height: 38,
                      width: 38,
                      alignment: Alignment.centerRight,
                      variant: IconButtonVariant.OutlineGreenA40024_2,
                      onTap: () {
                        onTapBtntf();
                      },
                      child:
                          CommonImageView(svgPath: ImageConstant.imgArrowleft)),
                  elevation: 0,
                  backgroundColor: ColorConstant.black900,
                  title: Text("lbl_purchases".tr,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.txtPoppinsMedium20),
                  centerTitle: true,
                ),
                backgroundColor: ColorConstant.black900,
                body: Container(
                    width: size.width,
                    child: SingleChildScrollView(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                          Container(
                              height: 200,
                              width: double.infinity,
                              margin:
                                  EdgeInsets.only(left: 25, top: 20, right: 15),
                              child: Stack(children: [
                                // if (controller.album != null)
                                CommonImageView(
                                    color: Colors.teal,
                                    fit: BoxFit.fitWidth,
                                    imagePath: "assets/images/cover.jpg",
                                    height: double.infinity,
                                    width: double.infinity),
                                // if (controller.song != null)
                                //   CommonImageView(
                                //       color: Colors.teal,
                                //       url: controller.song?.artwork,
                                //       height: double.infinity,
                                //       width: double.infinity),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration:
                                          AppDecoration.outlineBlack9000d,
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text.rich(
                                                TextSpan(
                                                    text: controller
                                                        .items?.length
                                                        .toString(),
                                                    children: [
                                                      TextSpan(
                                                          text: " Songs/Albums")
                                                    ]),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsSemiBold20),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            // Text.rich(
                                            //     TextSpan(
                                            //         text: controller
                                            //             .album?.artist?.name),
                                            //     overflow: TextOverflow.ellipsis,
                                            //     textAlign: TextAlign.left,
                                            //     style: AppStyle
                                            //         .txtSFProDisplaySemibold9),
                                            CommonImageView(
                                                svgPath:
                                                    ImageConstant.imgLevels,
                                                height: 10,
                                                width: 80)
                                          ])),
                                )
                              ])),
                          Container(
                              width: double.infinity,
                              padding:
                                  EdgeInsets.only(left: 25, top: 25, right: 25),
                              child: Text.rich(
                                  TextSpan(text: "KES", children: [
                                    TextSpan(text: " "),
                                    TextSpan(
                                        text: controller.items
                                            ?.fold(
                                                0.00,
                                                (value, item) =>
                                                    (value! as double) +
                                                    double.parse(
                                                        item['basePrice']))
                                            .toString()),
                                  ]),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsSemiBold20)),
                          Divider(
                            height: 40,
                            color: ColorConstant.whiteA70026,
                          ),
                          Text("lbl_payment_option".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium18),
                          Obx(() => Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, top: 10),
                                child: Column(children: [
                                  CustomRadioButton(
                                      text: "lbl_card".tr,
                                      iconSize: 24,
                                      value: "0",
                                      groupValue: controller.radioGroup.value,
                                      onChange: (value) {
                                        controller.radioGroup.value = value;
                                      }),
                                  CustomRadioButton(
                                      text: "lbl_equitel".tr,
                                      iconSize: 24,
                                      value: "1",
                                      groupValue: controller.radioGroup.value,
                                      onChange: (value) {
                                        controller.radioGroup.value = value;
                                      }),
                                  CustomRadioButton(
                                      text: "lbl_mpesa".tr,
                                      iconSize: 24,
                                      value: "2",
                                      groupValue: controller.radioGroup.value,
                                      onChange: (value) {
                                        controller.radioGroup.value = value;
                                      })
                                ]),
                              )),
                          CustomTextFormField(
                              width: double.infinity,
                              focusNode: FocusNode(),
                              controller: controller.phonenumberController,
                              hintText: "lbl_0700_000_000".tr,
                              keyboardType: TextInputType.number,
                              margin:
                                  EdgeInsets.only(left: 25, top: 30, right: 25),
                              variant:
                                  TextFormFieldVariant.OutlineDeeporange50084,
                              textInputAction: TextInputAction.done,
                              alignment: Alignment.center),
                          CustomButton(
                              width: double.infinity,
                              text: "lbl_proceed".tr,
                              margin:
                                  EdgeInsets.only(left: 25, top: 30, right: 25),
                              variant: ButtonVariant.FillDeeporange500,
                              padding: ButtonPadding.PaddingAll11,
                              fontStyle: ButtonFontStyle.PoppinsMedium20,
                              onTap: (() async {
                                var order = {
                                  "items": controller.items?.map((item) {
                                    // Album? album = Album.fromJson(item);
                                    return {
                                      "itemId": item['id'],
                                      "itemType": "1",
                                      "price": double.tryParse(
                                          item['basePrice'] ?? "0")
                                    };
                                  }).toList(),
                                  "totalPrice": controller.items?.fold(
                                      0.00,
                                      (value, item) =>
                                          (value! as double) +
                                          double.parse(item['basePrice']))
                                };

                                // if (controller.album != null) {
                                //   Album album = controller.album!;
                                //   var order = {
                                //     "items": [
                                //       {
                                //         "itemId": album.id,
                                //         "itemType": "2",
                                //         "price": double.tryParse(
                                //             album.basePrice ?? "0")
                                //       },
                                //     ],
                                //     "totalPrice":
                                //         double.tryParse(album.basePrice ?? "0")
                                //   };
                                //   await controller.makePurchaseOrder(order,
                                //       successCall: showSuccess,
                                //       errCall: showError);
                                // }

                                // if (controller.song != null) {
                                //   Song song = controller.song!;
                                //   var order = {
                                //     "items": [
                                //       {
                                //         "itemId": song.id,
                                //         "itemType": "1",
                                //         "price": double.tryParse(
                                //             song.basePrice ?? "0")
                                //       },
                                //     ],
                                //     "totalPrice":
                                //         double.tryParse(song.basePrice ?? "0")
                                //   };
                                await controller.makePurchaseOrder(order,
                                    successCall: showSuccess,
                                    errCall: showError);
                              }),
                              alignment: Alignment.center),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 25, top: 27, right: 25),
                                  child: Text("lbl_powered_by".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtPoppinsMediumItalic8))),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25, top: 10, right: 25, bottom: 20),
                              child: CommonImageView(
                                  svgPath: ImageConstant.ingTendePayLogo,
                                  width: 55))
                        ]))))));
  }

  showSuccess() {
    Get.rawSnackbar(
      snackStyle: SnackStyle.FLOATING,
      boxShadows: null,
      backgroundGradient: null,
      margin: EdgeInsets.all(10),
      borderRadius: 5,
      duration: Duration(seconds: 1),
      backgroundColor: Colors.grey[900]!,
      messageText: Text(
        'Payment initiated successfully.',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  showError() {
    Get.rawSnackbar(
      snackStyle: SnackStyle.FLOATING,
      boxShadows: null,
      backgroundGradient: null,
      margin: EdgeInsets.all(10),
      borderRadius: 5,
      duration: Duration(seconds: 1),
      backgroundColor: Colors.red,
      messageText: Text(
        'Failed to initiate payment successfully.',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  onTapBtntf() {
    Get.back();
  }

  onTapBtnProceed() {
    Get.toNamed(AppRoutes.confirmPurchaseScreen);
  }
}
