import 'package:get/get.dart';
import 'package:solution_ke/presentation/playlist_screen/controller/playlist_controller.dart';

class PlaylistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlaylistController());
  }
}
