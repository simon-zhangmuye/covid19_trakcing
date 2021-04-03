import 'package:covid19_trakcing/controller/cases_controller.dart';
import 'package:get/get.dart';

class DefaultBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CasesController());
  }
}
