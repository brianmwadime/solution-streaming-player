import 'package:audio_manager/audio_manager.dart';

extension audioInfoParsing on AudioInfo {
  Map mediaItemToMap() {
    return {
      'title': this.title.toString(),
      'desc': this.desc.toString(),
      'url': this.url.toString(),
      'coverUrl': this.coverUrl.toString(),
    };
  }

  static AudioInfo mapToMediaItem(Map song) {
    return AudioInfo(song["url"].toString(),
        title: song["title"].toString(),
        desc: song["desc"].toString(),
        coverUrl: song["coverUrl"].toString());
  }

  // @override
  // bool operator ==(Object other) {
  //   return other.runtimeType == runtimeType &&
  //       other is AudioInfo &&
  //       other.url == url;
  // }
}
