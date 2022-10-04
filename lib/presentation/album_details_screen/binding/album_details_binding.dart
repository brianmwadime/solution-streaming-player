import '../controller/album_details_controller.dart';
import 'package:get/get.dart';

class AlbumDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlbumDetailsController());
  }
}
