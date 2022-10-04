import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({this.onChanged});

  final RxInt selectedIndex = 0.obs;

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

  final Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        child: BottomNavigationBar(
          backgroundColor: ColorConstant.tealA400,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CommonImageView(
                    svgPath: bottomMenuList[index].icon,
                    height: 18,
                    width: 18,
                    color: ColorConstant.whiteA700,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        // top: 13,
                        ),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsMedium12WhiteA700.copyWith(
                        // height: 1.00,
                        color: ColorConstant.whiteA700,
                      ),
                    ),
                  ),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CommonImageView(
                    svgPath: bottomMenuList[index].icon,
                    height: 20,
                    width: 20,
                    color: ColorConstant.black901,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 0,
                    ),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsMedium12Black902.copyWith(
                        // height: 1.00,
                        color: ColorConstant.black902,
                      ),
                    ),
                  ),
                ],
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged!(bottomMenuList[index].type);
          },
        ),
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
