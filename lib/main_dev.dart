import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/config/config.dart';
import 'main.dart';

void main() {
  var configuredApp = new Config(
    environment: Environment.DEVELOPMENT,
    debugMode: true,
    apiBaseUrl: 'http://localhost:8000',
    child: new MyApp(),
  );

  runApp(configuredApp);
}
