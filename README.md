# getx_template

A project template built to use GetX architecture for all platforms. Utilises Responsive views to build screen size relevant layouts.

## Control Flow

<img src="./assets/control diagram.png" width=600/>

Following SOLID Principles we stick to Abstractions of classes.

- Use abstractions of each Repo and Remote Source
- Remember to add these abstractions to `InitialBindings.dependencies()`

### Create Module

Execute the following terminal command:

```bash
bash create_module.sh demo_module
```

This will create a new folder in the `lib/src/modules` folder and `bindings`,`controllers` and `views` sub-folders.

This will also create relevant files and fill them with relevant content.

### Create Analytics

Execute the following terminal command:

```bash
bash create_analytics.sh
```

This will create a `BaseAnalyticsTool` to provide a template for each analytics tool you wish to register with your app. Modify the file as you need.

This also creates a file in `lib/src/app/analytics/analytics_service.dart` which uses the `GetxService` class.

Ensure setting up the `AnalyticsManager` in `InitialBindings` via:

```dart
Get.lazyPut(() => AnalyticsManager());
```

When you wish to register an event, simply execute this statement:

```dart
Get.find<AnalyticsManager>().logEvent(eventName: EventNames.eventName);
```
