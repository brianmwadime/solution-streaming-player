import 'package:get/get.dart';
import 'package:solution_ke/presentation/playlists_screen/controller/playlists_controller.dart';

class PlaylistsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlaylistsController());
  }
}
