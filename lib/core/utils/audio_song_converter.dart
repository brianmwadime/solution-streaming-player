import 'package:audio_manager/audio_manager.dart';
import 'package:solution_ke/data/models/song/song_response.dart';

class AudioInfoConverter {
  static Map mediaItemToMap(AudioInfo mediaItem) {
    return {
      'title': mediaItem.title.toString(),
      'desc': mediaItem.desc.toString(),
      'url': mediaItem.url.toString(),
      'coverUrl': mediaItem.coverUrl.toString(),
    };
  }

  static AudioInfo mapToAudioInfo(Map song) {
    return AudioInfo(
      song['url'].toString(),
      title: song['title'].toString(),
      desc: song['desc'].toString(),
      coverUrl: song["coverUrl"].toString(),
    );
  }

  static AudioInfo mapToMapAudioInfo(Map song) {
    return AudioInfo(
      song['filePath'].toString(),
      title: song['name'].toString(),
      desc: song['name'].toString(),
      coverUrl: song["artwork"].toString(),
    );
  }

  static AudioInfo mapSongToAudioInfo(Song song) {
    return AudioInfo(
      song.filePath.toString(),
      title: song.name.toString(),
      desc: song.name.toString(),
      coverUrl: song.artwork.toString(),
    );
  }
}
