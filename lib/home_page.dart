import 'package:flutter/material.dart';
import 'package:json_decode/stateful_home.dart';
import 'package:json_decode/stateless_home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON DECODE EXAMPLE'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('Use Stateful Mode'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StatefulHome()));
                }),
            RaisedButton(
                child: Text('Use FutureBuilder'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StatelessHome()));
                })
          ],
        ),
      ),
    );
  }
}
