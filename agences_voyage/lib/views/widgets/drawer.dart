import 'package:agences_voyage/views/trips/trips_view.dart';
import 'package:flutter/material.dart';
import '../home/Home_view.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Travel & Dream',
              style: TextStyle(fontSize: 30, color: Colors.white),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Acceuil'),
            onTap: () {
              Navigator.pushNamed(context, Home.routName);
            },
          ),
          Divider(
            color: Colors
                .red, //Divider est une methode pour mettre une barre de séparation entre les éléments
          ),
          ListTile(
            leading: Icon(Icons.flight),
            title: Text('Mes Voyages'),
            onTap: () {
              Navigator.pushNamed(context, TripsView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
