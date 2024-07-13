import 'package:get/get.dart';

class BaseGetController<T> extends GetxController with StateMixin<T> {
  final RxBool _inProgress = RxBool(false);

  set showProgress(bool show) => _inProgress.value = show;
  bool get isProgress => _inProgress.value;
}
