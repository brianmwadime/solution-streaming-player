import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({required this.selectedIndex, this.onChanged});

  final List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHome,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgMusic,
      title: "lbl_my_world".tr,
      type: BottomBarEnum.Myworld,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCheckmark,
      title: "lbl_account".tr,
      type: BottomBarEnum.Account,
    )
  ];

  final Function(BottomBarEnum, int)? onChanged;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BottomNavigationBar(
        backgroundColor: ColorConstant.tealA400,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 20,
        selectedItemColor: ColorConstant.black901,
        unselectedItemColor: ColorConstant.whiteA700,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonImageView(
                    svgPath: bottomMenuList[index].icon,
                    color: ColorConstant.whiteA700,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     top: 2,
                  //   ),
                  //   child: Text(
                  //     bottomMenuList[index].title ?? "",
                  //     overflow: TextOverflow.ellipsis,
                  //     textAlign: TextAlign.left,
                  //     style: AppStyle.txtPoppinsMedium12WhiteA700.copyWith(
                  //       // height: 1.00,
                  //       color: ColorConstant.whiteA700,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CommonImageView(
                    svgPath: bottomMenuList[index].icon,
                    color: ColorConstant.black901,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     top: 2,
                  //   ),
                  //   child: Text(
                  //     bottomMenuList[index].title ?? "",
                  //     overflow: TextOverflow.ellipsis,
                  //     textAlign: TextAlign.left,
                  //     style: AppStyle.txtPoppinsMedium12Black902.copyWith(
                  //       // height: 1.00,
                  //       color: ColorConstant.black902,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              label: bottomMenuList[index].title,
              tooltip: bottomMenuList[index].title);
        }),
        onTap: (index) {
          onChanged!(bottomMenuList[index].type, index);
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Myworld,
  Account,
}

class BottomMenuModel {
  BottomMenuModel({required this.icon, this.title, required this.type});

  String icon;

  String? title;

  BottomBarEnum type;
}

///Set default widget when screen is not configured with bottom menu
Widget getDefaultWidget() {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(10),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Please replace the respective Widget here',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
  );
}
