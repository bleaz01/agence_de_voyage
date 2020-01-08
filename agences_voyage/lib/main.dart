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
          padding: EdgeInsets.all(8.00),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                elevation: 5.00,
                child: Container(
                  height: 150.00,
                  color: Colors.blue,
                  child: Stack(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
