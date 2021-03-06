import 'package:agences_voyage/views/city/city_view.dart';
import 'package:agences_voyage/views/widgets/drawer.dart';
import 'package:flutter/material.dart';

import './widget/city_card.dart';
import '../../models/city_model.dart';
import '../widgets/drawer.dart';

class Home extends StatefulWidget {
  static String routName = '/';
  //-----------------------------------------------------//
  //  Datas non modifiable car c'est un widget sans étas //
  //  donct ont utilisent  final <type> variable         //
  //-----------------------------------------------------//

  // statefultwidget nous permets de rebuilt la class enfant _HomeState
  @override
  _HomeState createState() {
    //createState permet la creation de la class _HomeState mais aussi le rebuild de cet class et ces widget
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  // _HomeState herite de la class Home donc doit etre typé = <Home>
  // le _ suive du nom de la class nous permets de la rente privé car cet classe dois etre utilisé que dans ce fichier.

  //---------------------------//
  //    Datas modifiable       //
  //---------------------------//

  List cities = [
    City(name: 'Paris, France', image: 'assets/images/paris.jpg'),
    City(name: 'Shanghai, Chine', image: 'assets/images/shanghai.jpg'),
    City(name: 'Venice, Italie', image: 'assets/images/venice.jpg'),
  ];

  void switchCheck(city) {
    int index = cities.indexOf(city);
    setState(() {
      cities[index]['checked'] = !cities[index]
          ['checked']; // ! lors d'un boolean veut dire son contraire
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Travel & Dream'),
          actions: <Widget>[Icon(Icons.more_horiz)],
        ),
        drawer: MyDrawer(),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              //widget sans étas
              padding: EdgeInsets.all(10.00),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ...cities.map((city) {
                    // l'operateur spread = (...) permet de déstructurer notre liste pour pouvoir itérer sur les items
                    return CartCity(
                      city: city,
                    );
                  }),
                ],
              ),
            );
          },
          itemCount: cities.length,
        ));
  }
}
