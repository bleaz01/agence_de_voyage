import 'package:flutter/material.dart';
import '../../models/activity.model.dart';
import '../city/widgets/activity_card.dart';
import '../../datas/data.dart' as data;
import '../../datas/trip.dart';

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  Trip mytrip = Trip(activities: [], city: 'paris');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.keyboard_backspace,
          ),
          title: Text('Paris'),
          actions: <Widget>[Icon(Icons.keyboard_return)],
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10),
                height: 200,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(child: Text('Choissisez la date')),
                        RaisedButton(
                          child: Text('Slectionner une date'),
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                )),
            Expanded(
              //Expanded est obligator lors de l utilisation de GridView ou listeView si non bug car il prend tous l'espace
              child: GridView.count(
                crossAxisCount: 2,
                //crossAxisCount un instipensable car il nous permet de dire combiens d'element sur l'axe y et x
                children: widget.activities
                    .map(
                      (activity) => (ActivityCard(
                        activity: activity,
                      )),
                    )
                    .toList(),
              ),
            )
          ],
        ))
        // child: ListView.builder(
        //   // ListView permet de lister plusier data mais quand ils y a une multitude de data
        //   //on utilise ListView.builder car pour la chargement des datas c 'est plus optimal
        //   itemBuilder: (context, index) {
        //     return ActivityCard(activity: widget.activities[index]);
        //   },
        //   itemCount: widget.activities
        //       .length, //widget nous permets de recuperé des donné dans la StateFullwidget(le parent)
        );
  }
}
