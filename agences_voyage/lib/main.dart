import 'package:flutter/material.dart';

import './views/home/Home_view.dart';
import './views/city/city_view.dart';

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
      //home: Home(),  soit ou une route par défaut qui est '/' car sinon 'BUG'  et le / et une convention Flutter
      routes: {
        Home.routName: (context) {
          //Home.route est une autre methode pour géré nos route et qui est la plus conforme
          return Home(); //car on crée une variable static dans le widget de la vue qui prend la valeur de '/'
        }, // et sa evite les erreur de typo
        CityView.routName: (context) {
          return CityView();
        }
      },
    );
  }
}
