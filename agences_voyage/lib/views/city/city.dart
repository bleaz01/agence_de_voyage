import 'package:agences_voyage/views/city/widgets/trip_activity_list.dart';
import 'package:flutter/material.dart';

import 'widgets/activity_list.dart';
import 'widgets/trip_overview.dart';
import '../city/widgets/trip_overview.dart';

import '../../models/activity.model.dart';
import '../../datas/data.dart' as data;
import '../../datas/trip.dart';

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  Trip mytrip = Trip(activities: [], city: 'paris', date: DateTime.now());

  var index = 0;

  void setDate() {
    showDatePicker(
            // future pour rechercher un calandrier
            context: context,
            initialDate: DateTime.now().add(Duration(
                days:
                    1)), // .add(Duration(day:1)) == a la date now plus 1 jours
            firstDate: DateTime.now(),
            lastDate: DateTime(2021))
        .then((newDate) {
      if (newDate != null) {
        setState(() {
          mytrip.date = newDate;
        });
      }
    });
  }

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.keyboard_backspace,
        ),
        title: Text('Organisation du voyage'),
        actions: <Widget>[Icon(Icons.keyboard_return)],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Overview(
              mytrip: mytrip,
              setDate: setDate,
            ),
            Expanded(
                //Expanded est obligator lors de l utilisation de GridView ou listeView si non bug car il prend tous l'espace
                child: index == 0
                    ? ActivityList(list: widget.activities)
                    : TripActivityList())
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index, //currentIndex sert a avoir un index par default
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('decouverte'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Mes activités'),
          ),
        ],
        onTap: switchIndex,
      ),
    );
  }
}
