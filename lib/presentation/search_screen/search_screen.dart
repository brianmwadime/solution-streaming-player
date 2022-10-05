import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/data/models/song/song_response.dart';
import 'package:solution_ke/presentation/player_screen/controller/player_controller.dart';
import 'package:solution_ke/presentation/search_screen/controller/search_controller.dart';
import 'package:solution_ke/presentation/search_screen/widgets/search_bar.dart';
import 'package:solution_ke/widgets/common_section_header.dart';
import 'package:solution_ke/widgets/custom_miniplayer.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          GetBuilder<SearchController>(
              init: SearchController(),
              builder: (controller) => Expanded(
                    child: Scaffold(
                        resizeToAvoidBottomInset: false,
                        backgroundColor: ColorConstant.black900,
                        body: SearchBar(
                            isYt: false,
                            controller: controller.searchController,
                            liveSearch: true,
                            autofocus: true,
                            hintText: "msg_search_favourit".tr,
                            leading: IconButton(
                              icon: const Icon(Icons.arrow_back_rounded),
                              onPressed: () => Get.back(),
                              color: ColorConstant.black900,
                            ),
                            body: (controller.searchedData.isEmpty)
                                ? Container()
                                : SingleChildScrollView(
                                    padding: EdgeInsets.only(top: 70),
                                    physics: const BouncingScrollPhysics(),
                                    child: Column(
                                      children: controller.position.keys
                                          .toList()
                                          .map((e) {
                                        final String key =
                                            controller.position[e].toString();
                                        final List? value = controller
                                            .searchedData[key] as List?;

                                        if (value == null) {
                                          return const SizedBox();
                                        }

                                        return Column(children: [
                                          SectionHeaderWidget(
                                              title: key,
                                              onTapMore: () {
                                                // TODO: Handle header clicks
                                              }),
                                          ListView.builder(
                                              itemCount: value.length,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              padding: const EdgeInsets.only(
                                                left: 5,
                                                right: 10,
                                              ),
                                              itemBuilder: (context, index) {
                                                String? countText;
                                                if (key == "Albums") {
                                                  final int count = value[index]
                                                          .songCount as int? ??
                                                      0;

                                                  count > 1
                                                      ? countText =
                                                          '$count ${"lbl_songs".tr}'
                                                      : countText =
                                                          '$count Song';
                                                }

                                                return ListTile(
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                    left: 15.0,
                                                  ),
                                                  title: Text(
                                                    '${value[index].name}',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  subtitle: Text(
                                                    key == 'Albums'
                                                        ? '$countText\n${value[index].year}'
                                                        : key == 'Songs'
                                                            ? '${value[index].trackLength}'
                                                            : '',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  isThreeLine: key == 'Albums',
                                                  leading: Card(
                                                    elevation: 8,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        key == 'Artists' ||
                                                                (key ==
                                                                    'Top Result')
                                                            ? 50.0
                                                            : 7.0,
                                                      ),
                                                    ),
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    child: value[index]
                                                                .artwork ==
                                                            null
                                                        ? null
                                                        : CachedNetworkImage(
                                                            fit: BoxFit.cover,
                                                            errorWidget:
                                                                (context, _,
                                                                        __) =>
                                                                    Image(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                key == 'Artists' ||
                                                                        (key ==
                                                                            'Top Result')
                                                                    ? 'assets/images/artist.png'
                                                                    : key ==
                                                                            'Songs'
                                                                        ? 'assets/images/cover.jpg'
                                                                        : 'assets/images/album.png',
                                                              ),
                                                            ),
                                                            imageUrl:
                                                                '${value[index].artwork?.replaceAll('http:', 'https:')}',
                                                            placeholder:
                                                                (context,
                                                                        url) =>
                                                                    Image(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                key == 'Artists' ||
                                                                        (key ==
                                                                            'Top Result')
                                                                    ? 'assets/images/artist.png'
                                                                    : key ==
                                                                            'Songs'
                                                                        ? 'assets/images/cover.jpg'
                                                                        : 'assets/images/album.png',
                                                              ),
                                                            ),
                                                          ),
                                                  ),
                                                  trailing: key != 'Albums'
                                                      ? key == 'Songs'
                                                          ? Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                // DownloadButton(
                                                                //   data: value[
                                                                //           index]
                                                                //       as Map,
                                                                //   icon:
                                                                //       'download',
                                                                // ),
                                                                // LikeButton(
                                                                //   mediaItem:
                                                                //       null,
                                                                //   data: value[
                                                                //           index]
                                                                //       as Map,
                                                                // ),
                                                                // SongTileTrailingMenu(
                                                                //   data: value[
                                                                //           index]
                                                                //       as Map,
                                                                // ),
                                                              ],
                                                            )
                                                          : null
                                                      : null,
                                                  onLongPress: () {
                                                    // copyToClipboard(
                                                    //   context: context,
                                                    //   text:
                                                    //       '${value[index]["title"]}',
                                                    // );
                                                  },
                                                  onTap: () {
                                                    key == 'Artists' ||
                                                            (key ==
                                                                'Top Result')
                                                        ? "GoToArtistSearchPAge"
                                                        : key == 'Songs'
                                                            ? onTapSong(
                                                                [value[index]])
                                                            : goToAlbum(
                                                                value[index]);
                                                  },
                                                );
                                              }),
                                        ]);
                                      }).toList(),
                                    ),
                                  ),
                            onSubmitted: ((String submittedQuery) {
                              controller.searchAlbums(submittedQuery);
                              controller.searchSongs(submittedQuery);
                              controller.searchPlaylists(submittedQuery);
                            }))),
                  )),
          MiniPlayer(),
        ],
      ),
    );
  }

  void onTapSong(List<Song> songs) {
    Get.find<PlayerController>().audioManager.stop();
    Get.find<PlayerController>().updatePlaylist(songs);
    Get.toNamed(AppRoutes.playerScreen,
        arguments: {NavigationArgs.songs: songs});
  }

  void goToAlbum(album) async {
    await Get.toNamed(AppRoutes.albumScreen,
        arguments: {NavigationArgs.album: album}, preventDuplicates: false);
  }
}
