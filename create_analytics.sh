
mkdir "lib/src/app/analytics"
mkdir "lib/src/app/analytics/base"
mkdir "lib/src/app/analytics/analytics_tools"
mkdir "lib/src/app/analytics/utilities"

touch "lib/src/base/base_analytics_tool.dart"
touch "lib/src/app/analytics/analytics_tools/tool.dart"
touch "lib/src/app/analytics/analytics_service.dart"
touch "lib/src/app/analytics/utilities/event_names.dart"
touch "lib/src/app/analytics/utilities/page_names.dart"

# write Analytics service
cat <<EOF > "lib/src/app/analytics/analytics_service.dart"
import 'package:get/get.dart';
import 'package:getx_template/src/app/analytics/analytics_tools/tool.dart';
import 'package:getx_template/src/base/base_analytics_tool.dart';
class AnalyticsManager extends GetxService {
  final List<BaseAnalyticsTool> _availableTools = [
    AnalyticsTool(),
  ];
  @override
  void onReady() {
    super.onReady();
    _setupTools();
  }
  Future<void> _setupTools() async {
    for (BaseAnalyticsTool tool in _availableTools) {
      await tool.setupTool();
    }
  }
  Future<void> logEvent({
    required String eventName,
    Map? eventParams,
  }) async {
    for (BaseAnalyticsTool tool in _availableTools) {
      await tool.logEvent(
        eventName: eventName,
        eventParams: eventParams,
      );
    }
  }
}
EOF

# Write analytics tool template
cat <<EOF > "lib/src/base/base_analytics_tool.dart"
abstract class BaseAnalyticsTool {
  Future<void> setupTool();
  Future<void> logEvent({
    required String eventName,
    Map? eventParams,
  });
}
EOF

# write an example analytics tool
cat <<EOF > "lib/src/app/analytics/analytics_tools/tool.dart"
import 'package:getx_template/src/base/base_analytics_tool.dart';
class AnalyticsTool extends BaseAnalyticsTool {
  final _toolExcludedEvents = <String>[];
  @override
  Future<void> setupTool() async {}
  @override
  Future<void> logEvent({required String eventName, Map? eventParams}) async {
    if (_toolExcludedEvents.contains(eventName)) {
      return;
    }
  }
}
EOF

# write event names file
cat <<EOF > "lib/src/app/analytics/utilities/event_names.dart"
class EventNames{
  static const String eventName = "event_name";
}
EOF

# write Screen names file
cat <<EOF > "lib/src/app/analytics/utilities/page_names.dart"
class PageNames{
  static const String pageName = "page_name";
}
EOF

printf "\n\nDon't forget to register the service from initial bindings"