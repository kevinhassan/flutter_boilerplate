import 'package:flutter/material.dart';

void show(BuildContext context, VoidCallback callback, String title,
    String message, String buttonTitle) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close')),
            FlatButton(
              onPressed: () {
                callback();
              },
              child: Text(buttonTitle),
            )
          ],
        );
      });
}
