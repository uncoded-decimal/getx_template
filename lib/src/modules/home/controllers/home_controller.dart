import 'package:get/get.dart';
import 'package:getx_template/src/app/routes/router.dart';
import 'package:getx_template/src/base/base_get_controller.dart';

class HomeController extends BaseGetController<Null> with Router {
  @override
  void onReady() {
    change(null, status: RxStatus.success());
    super.onReady();
  }
}
