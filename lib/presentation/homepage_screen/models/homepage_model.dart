import 'package:get/get.dart';
import 'package:solution_ke/data/models/album/album_response.dart';
import 'artist_item_model.dart';
import 'genre_item_model.dart';
import 'soundlevel_item_model.dart';

class HomepageModel {
  RxList<Album> albumsItemList = <Album>[].obs;

  RxList<ArtistsItemModel> artistsItemList = <ArtistsItemModel>[].obs;

  RxList<GenreItemModel> categoryItemsList = <GenreItemModel>[].obs;

  RxList<SoundLevelItemModel> categorySoundtemList =
      <SoundLevelItemModel>[].obs;
}
