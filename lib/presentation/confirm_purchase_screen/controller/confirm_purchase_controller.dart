import '/core/app_export.dart';
import 'package:solution_ke/presentation/confirm_purchase_screen/models/confirm_purchase_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

class ConfirmPurchaseController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<ConfirmPurchaseModel> confirmPurchaseModelObj = ConfirmPurchaseModel().obs;

  @override
  void codeUpdated() {
    otpController.value.text = code!;
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
