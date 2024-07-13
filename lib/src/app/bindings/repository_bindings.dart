import 'package:get/get.dart';
import 'package:getx_template/src/app/data/repository/home/home_repo.dart';
import 'package:getx_template/src/app/data/repository/home/home_repo_impl.dart';

class RepositoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeRepo>(HomeRepoImpl());
  }
}
