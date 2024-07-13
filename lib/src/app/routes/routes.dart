import 'package:get/get.dart';
import 'package:getx_template/src/app/routes/pages.dart';
import 'package:getx_template/src/modules/home/bindings/home_bindings.dart';
import 'package:getx_template/src/modules/home/views/home_view.dart';

class Routes {
  static const String initialRoute = Pages.home;

  static List<GetPage> get appRoutes => [
        GetPage(
          name: Pages.home,
          page: () => HomeView(),
          binding: HomeBindings(),
        ),
      ];
}
