import 'package:get/get.dart';

import '../controllers/update_relation_controller.dart';

class UpdateRelationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateRelationController>(
      () => UpdateRelationController(),
    );
  }
}
