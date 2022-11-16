import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:images_picker/images_picker.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';
import 'package:solution_ke/data/models/upload_response.dart';
import 'package:solution_ke/presentation/account_screen/widgets/account_item.dart';
import 'package:solution_ke/presentation/player_screen/controller/player_controller.dart';
import 'package:http/http.dart' as http;
import 'controller/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/presentation/profile_pic_bottomsheet/profile_pic_bottomsheet.dart';
import 'package:solution_ke/presentation/profile_pic_bottomsheet/controller/profile_pic_controller.dart';

class AccountScreen extends GetWidget<AccountController> {
  final Box settingsBox = Hive.box('settings');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text("lbl_account".tr,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.txtPoppinsMedium20),
                centerTitle: true,
                actions: []),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Container(
                      padding: EdgeInsets.only(left: 25, top: 25),
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(clipBehavior: Clip.none, children: [
                              Container(
                                  height: 68,
                                  width: 68,
                                  decoration: AppDecoration.fillWhiteA700
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder7),
                                  child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child: ValueListenableBuilder(
                                          valueListenable:
                                              settingsBox.listenable(),
                                          builder: (context, Box box, widget) {
                                            var avatar = box.get('avatar');

                                            return avatar == null
                                                ? CommonImageView(
                                                    svgPath:
                                                        ImageConstant.imgLogo)
                                                : CommonImageView(url: avatar);
                                          }))),
                              Positioned(
                                top: -16,
                                right: -16,
                                child: InkWell(
                                    onTap: () {
                                      requestCameraGalleryPermission();
                                    },
                                    child: CommonImageView(
                                        svgPath: ImageConstant.imgClock,
                                        height: 32,
                                        width: 32)),
                              )
                            ]),
                            Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Text.rich(
                                              TextSpan(
                                                  text: Hive.box('settings')
                                                      .get('name')),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsSemiBold15)),
                                      Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text.rich(
                                              TextSpan(
                                                  text: Hive.box('settings')
                                                      .get('mobileNo')),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  AppStyle.txtPoppinsRegular10))
                                    ]))
                          ])),
                  SizedBox(
                    height: 50,
                  ),
                  AccountItemWidget(
                    title: "lbl_change_photo".tr,
                    icon: ImageConstant.imgUser,
                    onClicked: () => requestCameraGalleryPermission(),
                  ),
                  AccountItemWidget(
                    title: "lbl_change_bio".tr,
                    icon: ImageConstant.imgUser,
                    onClicked: () => Get.toNamed(AppRoutes.changeBioScreen),
                  ),
                  AccountItemWidget(
                    title: "msg_purchase_histor".tr,
                    icon: ImageConstant.imgUserPayments,
                    onClicked: () =>
                        Get.toNamed(AppRoutes.purchaseHistoryScreen),
                  ),
                  AccountItemWidget(
                    title: "playlists".tr,
                    icon: ImageConstant.imgPlay10X7,
                    onClicked: () => Get.toNamed(AppRoutes.playlistsScreen),
                  ),
                  AccountItemWidget(
                    title: "msg_terms_of_servic".tr,
                    icon: ImageConstant.imgCar,
                    onClicked: () =>
                        Get.toNamed(AppRoutes.termsConditionsScreen),
                  ),
                  AccountItemWidget(
                    title: "About",
                    icon: ImageConstant.imgInfo,
                    onClicked: () => Get.toNamed(AppRoutes.aboutScreen),
                  ),
                  AccountItemWidget(
                    title: "Logout",
                    icon: ImageConstant.imgInfo,
                    onClicked: () => logout(),
                  )
                ]))));
  }

  logout() {
    Get.find<PlayerController>().audioManager.stop();
    Get.find<PlayerController>().audioManager.release();
    controller.logout(successCall: _onSuccess);
  }

  onTapAccount() {
    Get.bottomSheet(
      ProfilePicBottomsheet(
        Get.put(
          ProfilePicController(),
        ),
      ),
      isScrollControlled: true,
    );
  }

  _onSuccess() {
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  onTapBtnBack() {
    Get.back();
  }

  requestCameraGalleryPermission() async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);

    await FileManager().showModelSheetForImage(getImages: (images) async {
      Uri uri = Uri.parse('${Get.find<ApiClient>().url}/device/api/v1/upload');
      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll({
        "Authorization": "Bearer ${Get.find<PrefUtils>().getToken()}",
        'Content-Type': 'multipart/form-data',
      });
      for (Media? image in images) {
        request.files
            .add(await http.MultipartFile.fromPath('files', image!.path));
      }

      http.StreamedResponse response = await request.send();
      var responseBytes = await response.stream.toBytes();
      var responseString = utf8.decode(responseBytes);

      UploadResponse uploadResponse =
          UploadResponse.fromJson(jsonDecode(responseString));

      if (uploadResponse.data != null) {
        print(uploadResponse.data!.uploadFileRes!.data!.uploadSuccess![0].path);

        var data = {
          'avatar':
              uploadResponse.data!.uploadFileRes!.data!.uploadSuccess![0].path
        };

        controller.callUpdateUpdateProfile(data, successCall: ((data) {
          settingsBox.put('avatar', data.data?.avatar);
        }), errCall: (() {}));
      }
    });
  }
}
