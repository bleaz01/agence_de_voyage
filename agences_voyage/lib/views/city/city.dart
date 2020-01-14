import 'package:agences_voyage/views/city/widgets/trip_activity_list.dart';
import 'package:flutter/material.dart';

import '../../widget/data.dart';
import 'widgets/activity_list.dart';
import 'widgets/trip_overview.dart';
import '../city/widgets/trip_overview.dart';

import '../../models/activity.model.dart';
import '../../datas/trip.dart';

class City extends StatefulWidget {
  showMyOrentation({context, List<Widget> children}) {
    final orientation = MediaQuery.of(context)
        .orientation; //sa nous permet de controler la view horizontal et vertical du gsm

    if (orientation == Orientation.landscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    } else {
      return Column(
        children: children,
      );
    }
  }

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  Trip mytrip;
  List<Activity> activities;

  var index;

  @override
  void initState() {
    super.initState();
    mytrip = Trip(activities: [], city: 'paris', date: null);
    index = 0;
  }

  List<Activity> get myActivities {
    return activities
        .where((activity) => mytrip.activities.contains(activity.id))
        .toList();
  }

  void setDate() {
    showDatePicker(
            // future pour charger un calandrier
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

  void toogleActivities(String id) {
    // .containes sert a iteré sur une liste pour trouvé un elements dans la list
    //donc on lui dit que si il trouve l'id il la remove sinon il la add
    setState(() {
      mytrip.activities.contains(id)
          ? mytrip.activities.remove(id)
          : mytrip.activities.add(id);
    });
  }

  void deleteActivity(String id) {
    setState(() {
      mytrip.activities.remove(id);
    });
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    activities = Data.of(context)
        .activities; // ici nous recuperons nos data facilement grace
    // ou Inheritewidget dans notre fichier widget/data.dart
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
        child: widget.showMyOrentation(
          context: context,
          children: <Widget>[
            Overview(
              mytrip: mytrip,
              setDate: setDate,
            ),
            Expanded(
                //Expanded est obligator lors de l utilisation de GridView ou listeView si non bug car il prend tous l'espace
                child: index == 0
                    ? ActivityList(
                        list: activities,
                        toogleActivities: toogleActivities,
                        selectedActivities: mytrip.activities)
                    : TripActivityList(
                        activities: myActivities,
                        delete: deleteActivity,
                      ))
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
