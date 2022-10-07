import 'package:audio_manager/audio_manager.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/presentation/playlist_screen/controller/playlist_controller.dart';
import 'package:solution_ke/widgets/common_snackbar.dart';
import 'package:solution_ke/widgets/common_text_input_dialog.dart';
import 'package:solution_ke/widgets/custom_gradient_containers.dart';

class AddToPlaylist {
  void addToPlaylist(BuildContext context, Map? mediaItem) {
    showModalBottomSheet(
      isDismissible: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return GetBuilder<PlaylistController>(
            init: PlaylistController(),
            builder: (controller) {
              return BottomGradientContainer(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text("create_playlist".tr),
                        leading: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: SizedBox.square(
                            dimension: 50,
                            child: Center(
                              child: Icon(
                                Icons.add_rounded,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          showTextInputDialog(
                            context: context,
                            keyboardType: TextInputType.name,
                            title: "create_new_playlist".tr,
                            onSubmitted: (String value) async {
                              final RegExp avoid =
                                  RegExp(r'[\.\\\*\:\"\?#/;\|]');
                              value.replaceAll(avoid, '').replaceAll('  ', ' ');
                              if (value.trim() == '') {
                                value =
                                    'Playlist ${controller.playlists.length}';
                              }

                              await controller.createPlaylist(value);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                      if (controller.playlists.isEmpty)
                        const SizedBox()
                      else
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.playlists.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: const SizedBox.square(
                                  dimension: 50,
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/album.png',
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                '${controller.playlists[index].name}',
                              ),
                              onTap: () async {
                                Navigator.pop(context);
                                if (mediaItem != null) {
                                  var request = {
                                    "playlistId":
                                        controller.playlists[index].id,
                                    "trackId": mediaItem["id"]
                                  };

                                  await controller.addToPlaylist(request,
                                      successCall: () {
                                    ShowSnackBar().showSnackBar(
                                      context,
                                      '${mediaItem["name"]} Added to ${controller.playlists[index].name}',
                                    );
                                  }, errCall: () {
                                    ShowSnackBar().showSnackBar(
                                      context,
                                      'Could not add song to playlist',
                                    );
                                  });
                                }
                              },
                            );
                          },
                        ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
