import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/src/app/bindings/initial_bindings.dart';
import 'package:getx_template/src/app/controllers/app_controller.dart';
import 'package:getx_template/src/app/localisation/strings.dart';
import 'package:getx_template/src/app/misc/themes.dart';
import 'package:getx_template/src/app/routes/routes.dart';
import 'package:getx_template/src/app/widgets/loading_widget.dart';

class App extends StatelessWidget {
  App({super.key}) {
    Get.put<AppController>(AppController());
    Get.put<Localisation>(Localisation());
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX Template",
      themeMode: Get.find<AppController>().defaultThemeMode,
      theme: AppTheme.getLightTheme(),
      darkTheme: AppTheme.getDarkTheme(),
      initialBinding: InitialBindings(),
      initialRoute: Routes.initialRoute,
      getPages: Routes.appRoutes,
      translations: Get.find<Localisation>(),
      locale: Get.find<Localisation>().defaultLocale,
      fallbackLocale: Get.find<Localisation>().fallbackLocale,
      translationsKeys: Get.find<Localisation>().keys,
      builder: (context, child) => GetBuilder<AppController>(
        builder: (controller) => Stack(
          children: [
            Visibility(
              visible: controller.isGlobalLoading,
              child: const LoadingWidget(),
            ),
            child ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
