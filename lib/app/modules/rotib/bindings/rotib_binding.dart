import 'package:get/get.dart';

import '../controllers/rotib_controller.dart';

class RotibBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RotibController>(
      () => RotibController(),
    );
  }
}
