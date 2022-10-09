import 'package:get/get.dart';
import 'package:solution_ke/presentation/albums_screen/controller/albums_controller.dart';

class AlbumsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlbumsController());
  }
}
