#!/bin/bash

if [ -z "$1" ]; then
  echo "No word provided. Please provide a word as an argument."
  exit 1
fi

key=$1

mkdir "lib/src/modules/$key"
mkdir "lib/src/modules/$key/bindings"
touch "lib/src/modules/$key/bindings/${key}_bindings.dart"
mkdir "lib/src/modules/$key/controllers"
touch "lib/src/modules/$key/controllers/${key}_controller.dart"
mkdir "lib/src/modules/$key/views"
touch "lib/src/modules/$key/views/${key}_view.dart"
mkdir "lib/src/modules/$key/widgets"

camelCaseKey=$(echo "$1" | awk -F'_' '{for (i=2; i<=NF; i++) $i=toupper(substr($i,1,1)) substr($i,2)} 1' OFS='')
pascalCaseKey=$(echo "$1" | awk -F'_' '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))} 1' OFS='')

# write bindings
cat <<EOF > "lib/src/modules/$key/bindings/${key}_bindings.dart"
import 'package:get/get.dart';
import 'package:getx_template/src/modules/${key}/controllers/${key}_controller.dart';
class ${pascalCaseKey}Bindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ${pascalCaseKey}Controller());
  }
}
EOF

# write controller
cat <<EOF > "lib/src/modules/$key/controllers/${key}_controller.dart"
import 'package:get/get.dart';
import 'package:getx_template/src/app/routes/router.dart';
import 'package:getx_template/src/base/base_get_controller.dart';
class ${pascalCaseKey}Controller extends BaseGetController<Null> with Router {
  @override
  void onReady() {
    change(null, status: RxStatus.success());
    super.onReady();
  }
}
EOF

# write view
cat <<EOF > "lib/src/modules/$key/views/${key}_view.dart"
import 'package:flutter/material.dart';
import 'package:getx_template/src/base/base_get_view.dart';
import 'package:getx_template/src/modules/${key}/controllers/${key}_controller.dart';
class ${pascalCaseKey}View extends BaseGetView<${pascalCaseKey}Controller> {
  const ${pascalCaseKey}View({super.key});
  @override
  Widget phoneBody(state) => const Text("Phone");
}
EOF