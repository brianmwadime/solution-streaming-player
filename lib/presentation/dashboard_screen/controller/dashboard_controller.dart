import 'package:flutter/material.dart';

import '/core/app_export.dart';
import 'package:solution_ke/widgets/custom_bottom_bar.dart';

class DashboardController extends GetxController {
  int? userid = Get.find<PrefUtils>().getUserId();

  PageController pageController = PageController();

  Rx<BottomBarEnum> type = BottomBarEnum.Home.obs;

  Rx<int> tabIndex = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }
}
