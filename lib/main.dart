import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'page.dart';

void main() {
 // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Badger Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Page(title: 'das demo'),
    );
  }
}
