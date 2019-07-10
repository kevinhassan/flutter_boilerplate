import 'package:flutter/material.dart';

import 'config.dart';
import 'main.dart';

void main() {
  var configuredApp = new Config(
    appName: 'DeviceBoard',
    environment: 'Production',
    apiBaseUrl: 'http://example.com:8000',
    child: new MyApp(),
  );

  runApp(configuredApp);
}
