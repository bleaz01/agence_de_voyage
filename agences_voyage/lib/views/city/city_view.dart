import 'package:flutter/material.dart';

import '../../widget/data.dart';
import '../city/widgets/trip_activity_list.dart';
import 'widgets/activity_list.dart';
import 'widgets/trip_overview.dart';
import '../city/widgets/trip_overview.dart';

import '../../models/activity.model.dart';
import '../../models/city_model.dart';
import '../../datas/trip.dart';
import '../../datas/data.dart' as data;

class CityView extends StatefulWidget {
  final List<Activity> activities = data.activities;
  static String routName = '/city';

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

class _CityState extends State<CityView> {
  // with WidgetsBindingObserver {
  // WidgetsBindingObserver sert a savoir l'etap du gsm
  // etat = fermer, en background, etc ..
  Trip mytrip;

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

  double get amount {
    return mytrip.activities.fold(0.00, (pres, element) {
      var activity = widget.activities
          .firstWhere((activities) => activities.id == element);
      return pres + activity.prix;
    });
  }

  List<Activity> get myActivities {
    return widget.activities
        .where((activity) => mytrip.activities.contains(activity.id))
        .toList();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   // AppLifecycleState nous permets de savoir l'état de notre GSM
  //   super.didChangeAppLifecycleState(
  //       state); // Rappel état = pause, inactive, fermer, background
  //   print(this);
  // }

  void setDate() {
    showDatePicker(
            // showDatePicker est une future pour un calandrier
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

  // @override
  // didChangeDependencies() {
  //   super.didChangeDependencies();
  //   activities = Data.of(context)
  //       .activities; // ici nous récuperons nos data facilement grace Inheritewidget dans notre fichier widget/data.dart
  // }

  @override
  void dispose() {
    super.dispose();
    // WidgetsBinding.instance.removeObserver(
    //     this); // nous permets de suprimer l'observateur quand il sert a rien
    // IMPORTANT toujour le couper
  }

  @override
  Widget build(BuildContext context) {
    final City city = ModalRoute.of(
            context) //ModalRout.of(context) nous permets de récuprer les donnés dans le widget de déstination
        .settings
        .arguments; // settings regroupe tout les proprité de la route

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () {
            Navigator.pop(
                context); // Navigator.pop(context) retire de la stack ensemble du widget(context), donc créer un retour au widget en dessous
          },
        ),
        title: Text('Organisation du voyage'),
        actions: <Widget>[Icon(Icons.keyboard_return)],
      ),
      body: Container(
        child: widget.showContext(
          context: context,
          children: <Widget>[
            Overview(
                cityName: city.name,
                mytrip: mytrip,
                setDate: setDate,
                amount: amount),
            Expanded(
                //Expanded est obligatoire lors de l'utilisation de GridView ou listeView  "BUG" car il prend tout l'espace
                child: index == 0
                    ? ActivityList(
                        list: widget.activities,
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
        currentIndex:
            index, //currentIndex nous sert à avoir un index par défaut
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
