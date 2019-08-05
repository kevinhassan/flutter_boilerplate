import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/config/config.dart';
import 'main.dart';

void main() {
  var configuredApp = new Config(
    environment: Environment.PRODUCTION,
    apiBaseUrl: 'http://example.com:8000',
    child: new MyApp(),
  );

  runApp(configuredApp);
}
