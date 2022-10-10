import 'package:solution_ke/data/models/album/album_response.dart';
import 'package:solution_ke/data/models/genres/genre_list_response.dart';
import 'package:solution_ke/data/models/releases/releases_response.dart';
import 'package:solution_ke/data/models/song/song_response.dart';
import 'package:solution_ke/presentation/album_screen/controller/album_controller.dart';
import 'package:solution_ke/presentation/categories_screen/widgets/category_item_widget.dart';
import 'package:solution_ke/presentation/player_screen/controller/player_controller.dart';
import 'package:solution_ke/widgets/custom_miniplayer.dart';

import 'controller/categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';

class CategoriesScreen extends GetWidget<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Scaffold(
              appBar: AppBar(
                leading: CustomIconButton(
                    padding: IconButtonPadding.PaddingAll1,
                    height: 38,
                    width: 38,
                    alignment: Alignment.centerRight,
                    onTap: () => Get.back(),
                    child:
                        CommonImageView(svgPath: ImageConstant.imgArrowleft)),
                elevation: 0,
                title: Text("Categories",
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.txtPoppinsMedium18),
                centerTitle: true,
                backgroundColor: ColorConstant.black900,
              ),
              backgroundColor: ColorConstant.black900,
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // if (controller.pageType.value == 1)
                    //   PlaylistHead(
                    //     songsList: controller.songs,
                    //     offline: false,
                    //     fromDownloads: false,
                    //   ),
                    const SizedBox(height: 5),
                    Obx(() => GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(20),
                          shrinkWrap: true,
                          itemCount: controller.list.length,
                          itemBuilder: ((context, index) {
                            Genre category = controller.list[index];
                            return GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.songsScreen,
                                      arguments: {
                                        NavigationArgs.typeId: category.id,
                                        NavigationArgs.pageType: 2,
                                        NavigationArgs.pageTitle: category.name
                                      });
                                },
                                child: CategoryItemWidget(
                                  model: category,
                                ));
                          }),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  mainAxisExtent: 100,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 20),
                        ))
                  ],
                ),
              )),
        ),
        MiniPlayer()
      ],
    );
  }

  onTapBtnBack() {
    Get.back();
  }
}
