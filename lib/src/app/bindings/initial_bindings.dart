import 'package:get/get.dart';
import 'package:getx_template/src/app/bindings/remote_bindings.dart';
import 'package:getx_template/src/app/bindings/repository_bindings.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    RemoteBindings().dependencies();
    RepositoryBindings().dependencies();
  }
}
