import 'package:get/instance_manager.dart';
import 'package:getx_template/src/app/data/local/local_database_impl.dart';
import 'package:getx_template/src/app/data/remote/home/home_remote.dart';
import 'package:getx_template/src/app/data/repository/home/home_repo.dart';

class HomeRepoImpl with LocalDatabaseHelper implements HomeRepo {
  final _homeRemoteSource = Get.find<HomeRemote>();
}
