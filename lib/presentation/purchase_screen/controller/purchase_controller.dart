import 'package:solution_ke/data/apiClient/api_client.dart';
import 'package:solution_ke/data/models/album/album_response.dart';
import 'package:solution_ke/data/models/song/song_response.dart';

import '/core/app_export.dart';
import 'package:solution_ke/presentation/purchase_screen/models/purchase_model.dart';
import 'package:flutter/material.dart';

class PurchaseController extends GetxController {
  final args = Get.arguments;
  Song? song;
  Album? album;

  TextEditingController phonenumberController = TextEditingController();

  Rx<PurchaseModel> purchaseModelObj = PurchaseModel().obs;

  RxString radioGroup = "2".obs;

  @override
  void onInit() {
    super.onInit();

    if (args[NavigationArgs.song] != null) {
      this.song = args[NavigationArgs.song];
    }

    if (args[NavigationArgs.album] != null) {
      this.album = args[NavigationArgs.album];
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    phonenumberController.dispose();
  }

  Future<void> makePurchaseOrder(dynamic data,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().makePurchaseOrder(
        onSuccess: (resp) {
          onSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: data);
  }

  onError(error) {}

  onSuccess(response) {
    print(response);
  }
}
