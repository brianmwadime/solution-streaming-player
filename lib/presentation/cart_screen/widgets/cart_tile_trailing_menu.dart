/*
 *  This file is part of BlackHole (https://github.com/Sangwan5688/BlackHole).
 * 
 * BlackHole is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * BlackHole is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with BlackHole.  If not, see <http://www.gnu.org/licenses/>.
 * 
 * Copyright (c) 2021-2022, Ankit Sangwan
 */

import 'package:audio_manager/audio_manager.dart';
import 'package:flutter/material.dart';

import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/core/utils/add_media_to_queue.dart';
import 'package:solution_ke/core/utils/audio_song_converter.dart';
import 'package:solution_ke/data/models/album/album_response.dart';
import 'package:solution_ke/widgets/common_add_playlist.dart';

class CartTileTrailingMenu extends StatefulWidget {
  final Map data;
  final bool isPlaylist;
  final Function(Map)? deleteLiked;
  const CartTileTrailingMenu({
    super.key,
    required this.data,
    this.isPlaylist = false,
    this.deleteLiked,
  });

  @override
  _CartTileTrailingMenuState createState() => _CartTileTrailingMenuState();
}

class _CartTileTrailingMenuState extends State<CartTileTrailingMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.more_vert_rounded,
        color: ColorConstant.whiteA70061,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      itemBuilder: (context) => [
        if (widget.isPlaylist)
          PopupMenuItem(
            value: 6,
            child: Row(
              children: [
                const Icon(
                  Icons.delete_rounded,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Remove",
                ),
              ],
            ),
          ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Icon(
                Icons.queue_music_rounded,
                color: Theme.of(context).iconTheme.color,
              ),
              const SizedBox(width: 10.0),
              Text("Play Next"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(
                Icons.playlist_add_rounded,
                color: Theme.of(context).iconTheme.color,
              ),
              const SizedBox(width: 10.0),
              Text("Add to Queue"),
            ],
          ),
        ),
        if (!widget.isPlaylist)
          PopupMenuItem(
            value: 0,
            child: Row(
              children: [
                Icon(
                  Icons.playlist_add_rounded,
                  color: Theme.of(context).iconTheme.color,
                ),
                const SizedBox(width: 10.0),
                Text("Add to Playlist"),
              ],
            ),
          ),
        if (widget.data["album"] != null)
          PopupMenuItem(
            value: 4,
            child: Row(
              children: [
                Icon(
                  Icons.album_rounded,
                  color: Theme.of(context).iconTheme.color,
                ),
                const SizedBox(width: 10.0),
                Text("View Album"),
              ],
            ),
          ),
        if (widget.data["artist"] != null)
          PopupMenuItem(
            value: 5,
            child: Row(
              children: [
                Icon(
                  Icons.person_rounded,
                  color: Theme.of(context).iconTheme.color,
                ),
                const SizedBox(width: 10.0),
                Text("View Artist"),
              ],
            ),
          ),
        // PopupMenuItem(
        //   value: 3,
        //   child: Row(
        //     children: [
        //       Icon(
        //         Icons.share_rounded,
        //         color: Theme.of(context).iconTheme.color,
        //       ),
        //       const SizedBox(width: 10.0),
        //       Text("Share"),
        //     ],
        //   ),
        // ),
      ],
      onSelected: (int? value) {
        final AudioInfo mediaItem =
            AudioInfoConverter.mapToMapAudioInfo(widget.data);
        if (value == 3) {
          // Share.share(widget.data['perma_url'].toString());
        }
        if (value == 4) {
          Get.toNamed(AppRoutes.albumScreen, arguments: {
            NavigationArgs.album: Album.fromJson(widget.data["album"])
          });
        }
        if (value == 5) {
          // Navigator.push(
          //   context,
          //   PageRouteBuilder(
          //     opaque: false,
          //     pageBuilder: (_, __, ___) => AlbumSearchPage(
          //       query: mediaItem.artist.toString().split(', ').first,
          //       type: 'Artists',
          //     ),
          //   ),
          // );
        }
        if (value == 6) {
          widget.deleteLiked!(widget.data);
        }
        if (value == 0) {
          AddToPlaylist().addToPlaylist(context, widget.data);
        }
        if (value == 1) {
          addToNowPlaying(context: context, mediaItem: mediaItem);
        }
        if (value == 2) {
          playNext(mediaItem, context);
        }
      },
    );
  }
}
