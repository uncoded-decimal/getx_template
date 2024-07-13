import 'package:get/route_manager.dart';
import 'package:getx_template/src/app/routes/pages.dart';

mixin Router {
  Future<void> goToHome() async => await Get.to(Pages.home);
}
