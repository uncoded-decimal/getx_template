import 'package:flutter/material.dart';
import 'package:getx_template/src/base/base_get_view.dart';
import 'package:getx_template/src/modules/home/controllers/home_controller.dart';

class HomeView extends BaseGetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget watchBody(state) => const Text("Watch");

  @override
  Widget phoneBody(state) => const Text("Phone");

  @override
  Widget tabletBody(state) => const Text("Tablet");

  @override
  Widget desktopBody(state) => const Text("Desktop");
}
