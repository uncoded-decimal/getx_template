import 'package:get/get.dart';
import 'package:getx_template/src/app/data/remote/home/home_remote.dart';
import 'package:getx_template/src/app/data/remote/home/home_remote_impl.dart';

class RemoteBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeRemote>(HomeRemoteImpl());
  }
}
