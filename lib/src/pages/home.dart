import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _result = "";
  MethodChannel _channel =
      MethodChannel('flutter_boilerplate/NAME_YOUR_CHANNEL');

  Future<void> _getDataFromChannel() async {
    try {
      final String result = await _channel.invokeMethod('NAME_YOUR_METHOD');
      setState(() {
        _result = result;
      });
    } on PlatformException catch (e) {
      return Future.error(e.message);
    }
  }

  void initState() {
    super.initState();
    _getDataFromChannel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("DropDown Button Example"),
        ),
        body: Container(
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Home"),
              Text("result from channel : $_result")
            ],
          )),
        ),
      ),
    );
  }
}
