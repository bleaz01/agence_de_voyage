import 'package:flutter/material.dart';

import './views/home/Home_view.dart';
import './views/city/city_view.dart';
import './widget/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:
            false, // debugShowCheckedModeBanner:  la banier de debug
        title: 'voyages',
        theme: ThemeData(
          primarySwatch: Colors.green,
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: 'Schyler'),
                ),
          ),
        ),

        // home: Data(
        //   child: City(),
        // ),
        home: Home());
  }
}
