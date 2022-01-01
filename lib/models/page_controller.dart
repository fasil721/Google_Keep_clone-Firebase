import 'package:get/get.dart';

class PageController extends GetxController {}

class PageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PageController());
  }
}
