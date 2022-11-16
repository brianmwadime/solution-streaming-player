import 'package:get/get.dart';
import 'package:solution_ke/presentation/songs_screen/controller/songs_controller.dart';

class SongsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SongsController());
  }
}
