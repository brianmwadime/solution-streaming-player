import 'dart:convert';

import 'package:audio_manager/audio_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:solution_ke/core/utils/audio_info_utils.dart';

Future<void> addRecentlyPlayed(AudioInfo mediaitem) async {
  List recentList = await Hive.box('cache')
      .get('recentSongs', defaultValue: [])?.toList() as List;

  final Map item = mediaitem.mediaItemToMap();
  recentList.insert(0, item);

  final jsonList = recentList.map((item) => jsonEncode(item)).toList();
  final uniqueJsonList = jsonList.toSet().toList();
  recentList = uniqueJsonList.map((item) => jsonDecode(item)).toList();

  if (recentList.length > 30) {
    recentList = recentList.sublist(0, 30);
  }
  Hive.box('cache').put('recentSongs', recentList);
}
