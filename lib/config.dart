import 'package:flutter/material.dart';

class Config extends InheritedWidget {
  Config({
    @required this.appName,
    @required this.environment,
    @required this.apiBaseUrl,
    this.debugMode = false,
    @required Widget child,
  }) : super(child: child);

  final String appName;
  final String environment;
  final bool debugMode;
  final String apiBaseUrl;

  static Config of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(Config);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
