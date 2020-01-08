import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text('Travel & Dream'),
          actions: <Widget>[Icon(Icons.more_horiz)],
        ),
        body: Container(
          child: Text('Take your travel'),
        ),
      ),
    );
  }
}
