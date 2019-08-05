import 'package:flutter/material.dart';

enum Environment { DEVELOPMENT, PRODUCTION }

class Config extends InheritedWidget {
  Config({
    @required this.environment,
    @required this.apiBaseUrl,
    this.debugMode = false,
    @required Widget child,
  }) : super(child: child);

  final Environment environment;
  final bool debugMode;
  final String apiBaseUrl;

  static Config of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(Config);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
