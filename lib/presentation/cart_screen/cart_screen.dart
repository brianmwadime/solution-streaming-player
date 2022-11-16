import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/data/models/album/album_response.dart';
import 'package:solution_ke/data/models/song/song_response.dart';
import 'package:solution_ke/presentation/cart_screen/controller/cart_controller.dart';
import 'package:solution_ke/presentation/player_screen/controller/player_controller.dart';
import 'package:solution_ke/widgets/common_cart_head.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';
import 'package:solution_ke/widgets/custom_miniplayer.dart';

import 'widgets/cart_tile_trailing_menu.dart';

class CartScreen extends GetWidget<CartController> {
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
                title: Text("Cart",
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
                    CartHead(
                      cartList: Hive.box('cart').get('items', defaultValue: []),
                      buyItems: () => goToBuyScreen(
                          Hive.box('cart').get('items', defaultValue: [])),
                    ),
                    const SizedBox(height: 5),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: Hive.box('cart')
                            .get('items', defaultValue: []).length,
                        itemBuilder: ((context, index) {
                          var item = Hive.box('cart')
                              .get('items', defaultValue: [])[index];
                          return ListTile(
                            onTap: () {},
                            leading: Card(
                              elevation: 5,
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: CommonImageView(
                                  url: item['artwork'],
                                  imagePath: 'assets/images/cover.jpg',
                                ),
                              ),
                            ),
                            title: Text.rich(
                              TextSpan(text: item['name']),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              '${item['artist']?['name'] ?? 'Unknown'} • ${item['album']?['name'] ?? 'Unknown'}',
                              overflow: TextOverflow.ellipsis,
                              style: AppStyle.txtPoppinsMedium14WhiteA70099,
                            ),
                            // trailing: CartTileTrailingMenu(
                            //   data: item,
                            //   isPlaylist: false,
                            //   deleteLiked: (Map item) {
                            //     if (controller.pageType.value == 1) {
                            //       controller.deletePlaylistTrack(
                            //           controller.typeId.value, item["id"]);
                            //     }
                            //   },
                            // ),
                            trailing: Text.rich(
                                TextSpan(text: item['basePrice']),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyle.txtPoppinsMedium14WhiteA70099),
                          );
                        }))
                  ],
                ),
              )),
        ),
        MiniPlayer()
      ],
    );
  }

  onTapSong(List<Song> songs) {
    Get.find<PlayerController>().updatePlaylist(songs);
    Get.toNamed(AppRoutes.playerScreen,
        arguments: {NavigationArgs.songs: songs});
  }

  goToBuyScreen(List<dynamic> items) {
    Get.toNamed(AppRoutes.purchaseScreen,
        arguments: {NavigationArgs.cartItems: items});
  }
}
