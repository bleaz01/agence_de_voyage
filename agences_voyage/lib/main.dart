import 'package:flutter/material.dart';

import './home/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:
            false, // debugShowCheckedModeBanner: false sert a retirer le banner de debug
        title: 'voyages',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Home());
  }
}
