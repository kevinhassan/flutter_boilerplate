import 'package:flutter_boilerplate/src/config/config.dart';
import 'package:flutter_boilerplate/src/pages/home.dart';
import 'package:flutter_boilerplate/src/utils/constants.dart';
import 'package:flutter_boilerplate/src/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  final String _appName = Constants.appName;
  final List<DeviceOrientation> _preferredOrientations = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(_preferredOrientations);
    var config = Config.of(context);
    NetworkUtil(config.apiBaseUrl);
    return MaterialApp(
        title: _appName,
        debugShowCheckedModeBanner: config.debugMode,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(title: "Home"));
  }
}
