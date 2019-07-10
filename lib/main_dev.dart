import 'package:flutter/material.dart';
import 'config.dart';
import 'main.dart';

void main() {
  var configuredApp = new Config(
    appName: 'Flutter_boilerplate',
    environment: 'Development',
    debugMode: true,
    apiBaseUrl: 'http://localhost:8000',
    child: new MyApp(),
  );

  runApp(configuredApp);
}
