import 'package:flutter_boilerplate/src/pages/home.dart';
import 'package:flutter_boilerplate/src/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    var config = Config.of(context);
    NetworkUtil(config.apiBaseUrl);
    return MaterialApp(
        title: config.appName,
        debugShowCheckedModeBanner: config.debugMode,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(title: "Home"));
  }
}
