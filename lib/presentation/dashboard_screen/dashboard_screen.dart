import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/presentation/account_screen/account_screen.dart';
import 'package:solution_ke/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:solution_ke/presentation/homepage_screen/homepage_screen.dart';
import 'package:solution_ke/presentation/my_world_screen/my_world_screen.dart';
import 'package:solution_ke/widgets/custom_bottom_bar.dart';
import 'package:solution_ke/widgets/custom_miniplayer.dart';

class DashboardScreen extends GetWidget<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: Image.asset(ImageConstant.background).image,
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter),
        color: ColorConstant.black900,
      ),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  children: [
                    Container(child: HomepageScreen()),
                    Container(child: MyWorldScreen()),
                    Container(child: AccountScreen())
                  ],
                  controller: controller.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  // onPageChanged: controller.,
                ),
              ),
              MiniPlayer()
            ],
          ),
          bottomNavigationBar: SafeArea(
            child: Obx(() => CustomBottomBar(
                  onChanged: (BottomBarEnum type, int selectedIndex) {
                    controller.changeTabIndex(selectedIndex);
                    controller.pageController.jumpToPage(selectedIndex);
                  },
                  selectedIndex: controller.tabIndex.value,
                )),
          )),
    );
  }
}
