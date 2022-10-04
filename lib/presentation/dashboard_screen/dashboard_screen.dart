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
          bottomNavigationBar: CustomBottomBar(onChanged: (BottomBarEnum type) {
            controller.type.value = type;
            switch (type) {
              case BottomBarEnum.Home:
                controller.pageController.jumpToPage(0);
                break;
              case BottomBarEnum.Myworld:
                controller.pageController.jumpToPage(1);
                break;
              case BottomBarEnum.Account:
                controller.pageController.jumpToPage(2);
                break;
              default:
                controller.pageController.jumpToPage(0);
            }
          })),
    );
  }
}
