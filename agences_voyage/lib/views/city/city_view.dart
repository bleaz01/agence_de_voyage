import 'package:agences_voyage/views/city/widgets/trip_activity_list.dart';
import 'package:flutter/material.dart';

import '../../widget/data.dart';
import 'widgets/activity_list.dart';
import 'widgets/trip_overview.dart';
import '../city/widgets/trip_overview.dart';

import '../../models/activity.model.dart';
import '../../datas/trip.dart';

class City extends StatefulWidget {
  showContext({context, List<Widget> children}) {
    final orientation = MediaQuery.of(context).orientation;

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
  // with WidgetsBindingObserver {
  // WidgetsBindingObserver sert a savoir l'etap du gsm
  // etat = fermer, en background, etc ..
  Trip mytrip;
  List<Activity> activities;

  var index;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(
    //     this); // WidgetsBinding nous permet de sauvegarder notre widget
    // dans l'engine interne de flutter. (this) = ensemble du widget

    mytrip = Trip(activities: [], city: 'paris', date: null);
    index = 0;
  }

  List<Activity> get myActivities {
    return activities
        .where((activity) => mytrip.activities.contains(activity.id))
        .toList();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   // AppLifecycleState nous permet de savoir l'etas de notre Gsm
  //   super.didChangeAppLifecycleState(
  //       state); // Rappel etas = pause, inactive, fermer, background
  //   print(this);
  // }

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
    setState(() {
      // contains sert a iteré sur une liste pour y trouvé un éléments préci
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
        .activities; // ici nous récuperons nos data facilement grace Inheritewidget dans notre fichier widget/data.dart
  }

  @override
  void dispose() {
    super.dispose();
    // WidgetsBinding.instance.removeObserver(
    //     this); // nous permet de suprimer l'observateur quand il sert a rien
    // IMPORTANT toujour le couper
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
        child: widget.showContext(
          context: context,
          children: <Widget>[
            Overview(
              mytrip: mytrip,
              setDate: setDate,
            ),
            Expanded(
                //Expanded est obligatoire lors de l'utilisation de GridView ou listeView  "BUG" car il prend tout l'espace
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
        currentIndex: index, //currentIndex sert à avoir un index par default
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
