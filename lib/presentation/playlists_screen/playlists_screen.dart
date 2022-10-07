import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/widgets/common_text_input_dialog.dart';
import 'package:solution_ke/widgets/custom_icon_button.dart';
import 'package:solution_ke/widgets/custom_miniplayer.dart';

import 'controller/playlists_controller.dart';

class PlaylistsScreen extends GetWidget<PlaylistsController> {
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
                title: Text("playlists".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
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
                    const SizedBox(height: 5),
                    ListTile(
                      title: Text(
                        "create_playlist".tr,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      leading: SizedBox.square(
                        dimension: 50,
                        child: Center(
                          child: Icon(
                            Icons.add_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () async {
                        await showTextInputDialog(
                          context: context,
                          title: "create_new_playlist".tr,
                          initialText: '',
                          keyboardType: TextInputType.name,
                          onSubmitted: (String value) async {
                            final RegExp avoid = RegExp(r'[\.\\\*\:\"\?#/;\|]');
                            value.replaceAll(avoid, '').replaceAll('  ', ' ');
                            if (value.trim() == '') {
                              value = 'Playlist ${controller.playlists.length}';
                            }

                            await controller.createPlaylist(value);

                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                    // if (controller.playlists.length > 1)
                    Obx(() => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.playlists.length,
                        itemBuilder: ((context, index) {
                          final String showName =
                              controller.playlists[index].name ?? "";
                          return ListTile(
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
                                child: const Image(
                                  image: AssetImage(
                                    'assets/images/cover.jpg',
                                  ),
                                ),
                              ),
                            ),
                            title: Text.rich(
                              TextSpan(text: controller.playlists[index].name),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: PopupMenuButton(
                                icon: const Icon(
                                  Icons.more_vert_rounded,
                                  color: Colors.white,
                                ),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                ),
                                onSelected: (int? value) async {
                                  if (value == 3) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        final nameController =
                                            TextEditingController(
                                          text: showName,
                                        );
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "rename".tr,
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              TextField(
                                                autofocus: true,
                                                textAlignVertical:
                                                    TextAlignVertical.bottom,
                                                controller: nameController,
                                                onSubmitted: (value) async {
                                                  await controller
                                                      .updatePlaylist(
                                                          controller
                                                              .playlists[index]
                                                              .id,
                                                          value);

                                                  Navigator.pop(context);
                                                  // playlistDetails[name] ==
                                                  //         null
                                                  //     ? playlistDetails
                                                  //         .addAll({
                                                  //         name: {
                                                  //           'name':
                                                  //               value.trim()
                                                  //         }
                                                  //       })
                                                  //     : playlistDetails[name]
                                                  //         .addAll({
                                                  //         'name': value.trim()
                                                  //       });

                                                  // await settingsBox.put(
                                                  //   'playlistDetails',
                                                  //   playlistDetails,
                                                  // );
                                                },
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                foregroundColor:
                                                    Theme.of(context)
                                                        .iconTheme
                                                        .color,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "cancel".tr,
                                              ),
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                              ),
                                              onPressed: () async {
                                                await controller.updatePlaylist(
                                                    controller
                                                        .playlists[index].id,
                                                    value);

                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "ok".tr,
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                              .colorScheme
                                                              .secondary ==
                                                          Colors.white
                                                      ? Colors.black
                                                      : null,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }

                                  if (value == 0) {
                                    await controller.deletePlaylist(
                                        controller.playlists[index].id);
                                  }

                                  if (value == 2) {}
                                },
                                itemBuilder: ((context) => [
                                      PopupMenuItem(
                                        value: 3,
                                        child: Row(
                                          children: [
                                            const Icon(Icons.edit_rounded),
                                            const SizedBox(width: 10.0),
                                            Text(
                                              "Rename".tr,
                                            ),
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: 0,
                                        child: Row(
                                          children: [
                                            const Icon(Icons.delete_rounded),
                                            const SizedBox(width: 10.0),
                                            Text(
                                              "delete".tr,
                                            ),
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: 2,
                                        child: Row(
                                          children: [
                                            const Icon(Icons.share),
                                            const SizedBox(width: 10.0),
                                            Text(
                                              "share".tr,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ])),
                          );
                        })))
                  ],
                ),
              )),
        ),
        MiniPlayer()
      ],
    );
  }
}
