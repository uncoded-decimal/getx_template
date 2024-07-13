import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final RxBool _globalLoading = RxBool(false);
  set showGlobalLoading(bool flag) => _globalLoading.value = flag;
  bool get isGlobalLoading => _globalLoading.value;

  ThemeMode get defaultThemeMode => ThemeMode.light;
  set switchAppTheme(ThemeMode? themeMode) => Get.changeThemeMode(
      themeMode ?? (Get.isDarkMode ? ThemeMode.light : ThemeMode.dark));
}
