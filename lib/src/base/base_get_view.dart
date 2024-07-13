import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/src/base/base_get_controller.dart';

class BaseGetView<T extends BaseGetController> extends GetView<T> {
  const BaseGetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Stack(
        children: [
          Obx(
            () => Visibility(
              visible: controller.isProgress,
              child: getProgressWidget(),
            ),
          ),
          controller.obx(
            (state) => _body(state),
            onLoading: _loader(),
            onEmpty: _emptyBody(),
            onError: (error) => _errorBody(error),
          ),
        ],
      ),
    );
  }

  Widget getProgressWidget() => Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );

  AppBar getAppBar() => AppBar();

  Widget _body(dynamic state) => LayoutBuilder(
        builder: (context, constraints) {
          if (Get.width < 300) return watchBody(state);
          if (Get.width < 600) return phoneBody(state);
          if (Get.width < 1200) return tabletBody(state);
          return desktopBody(state);
        },
      );

  Widget watchBody(dynamic state) => const Placeholder();
  Widget phoneBody(dynamic state) => const Placeholder();
  Widget tabletBody(dynamic state) => const Placeholder();
  Widget desktopBody(dynamic state) => const Placeholder();

  Widget _loader() => LayoutBuilder(
        builder: (context, constraints) {
          if (Get.width < 300) return watchLoadingWidget();
          if (Get.width < 600) return phoneLoadingWidget();
          if (Get.width < 1200) return tabletLoadingWidget();
          return desktopLoadingWidget();
        },
      );

  Widget watchLoadingWidget() => const Placeholder();
  Widget phoneLoadingWidget() => const Placeholder();
  Widget tabletLoadingWidget() => const Placeholder();
  Widget desktopLoadingWidget() => const Placeholder();

  Widget _emptyBody() => LayoutBuilder(
        builder: (context, constraints) {
          if (Get.width < 300) return watchEmptyWidget();
          if (Get.width < 600) return phoneEmptyWidget();
          if (Get.width < 1200) return tabletEmptyWidget();
          return desktopEmptyWidget();
        },
      );

  Widget watchEmptyWidget() => const Placeholder();
  Widget phoneEmptyWidget() => const Placeholder();
  Widget tabletEmptyWidget() => const Placeholder();
  Widget desktopEmptyWidget() => const Placeholder();

  Widget _errorBody(String? error) => LayoutBuilder(
        builder: (context, constraints) {
          if (Get.width < 300) return watchErrorWidget(error);
          if (Get.width < 600) return phoneErrorWidget(error);
          if (Get.width < 1200) return tabletErrorWidget(error);
          return desktopErrorWidget(error);
        },
      );

  Widget watchErrorWidget(String? error) => const Placeholder();
  Widget phoneErrorWidget(String? error) => const Placeholder();
  Widget tabletErrorWidget(String? error) => const Placeholder();
  Widget desktopErrorWidget(String? error) => const Placeholder();
}
