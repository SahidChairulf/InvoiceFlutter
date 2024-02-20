import 'package:get/get.dart';

import '../controllers/formulir_controller.dart';

class FormulirBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormulirController>(
      () => FormulirController(),
    );
  }
}
