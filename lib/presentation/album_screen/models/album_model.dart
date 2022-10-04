import 'package:get/get.dart';
import 'package:solution_ke/data/models/album/album_response.dart';
import 'package:solution_ke/data/models/song/song_response.dart';
import 'package:solution_ke/data/models/updateProfile/profile_response.dart';

class AlbumModel {
  Rx<UserProfile>? artist = UserProfile().obs;

  Rx<Album>? album = Album().obs;

  RxList<Song> songsList = <Song>[].obs;

  RxList<Album> moreByArtistList = <Album>[].obs;
}
