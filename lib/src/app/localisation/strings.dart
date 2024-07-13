import 'dart:ui';

import 'package:get/get.dart';

class Localisation extends Translations {
  Locale get defaultLocale => const Locale("en", "US");
  Locale get fallbackLocale => const Locale("en", "US");

  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "hello": "Hello",
        },
      };
}
