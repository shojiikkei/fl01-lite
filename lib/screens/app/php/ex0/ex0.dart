import 'package:flutter/material.dart';
import 'dart:math' as math; //randomを使うためのライブラリをインポート


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '運勢占い',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: '運勢占い'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var fortune = ['大吉','中吉','吉','凶','大凶',];
  var random = math.Random();
  var result;

  void _shuffle() {
    setState(() {
      result = fortune[random.nextInt(fortune.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Text(
                  '$result',style: TextStyle(fontSize: 30,)
              ),
            ),
            RaisedButton(
              child: const Text('あなたの運勢は？'),
              shape: const UnderlineInputBorder(),
              onPressed: _shuffle,
            ),

          ],
        ),
      ),
    );
  }
}