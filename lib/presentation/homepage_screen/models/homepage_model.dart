import 'package:get/get.dart';
import 'package:solution_ke/data/models/album/album_response.dart';
import 'package:solution_ke/data/models/releases/releases_response.dart';
import 'package:solution_ke/data/models/song/song_response.dart';
import 'package:solution_ke/data/models/updateProfile/profile_response.dart';
import 'genre_item_model.dart';
import 'soundlevel_item_model.dart';

class HomepageModel {
  RxList<Album> albumsItemList = <Album>[].obs;

  RxList<UserProfile> artistsItemList = <UserProfile>[].obs;

  RxList<Song> trendingSongs = <Song>[].obs;

  RxList<Release> releasesList = <Release>[].obs;

  RxList<GenreItemModel> categoryItemsList = <GenreItemModel>[].obs;

  RxList<SoundLevelItemModel> categorySoundtemList =
      <SoundLevelItemModel>[].obs;
}
