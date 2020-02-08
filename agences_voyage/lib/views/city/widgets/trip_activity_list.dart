import 'package:flutter/material.dart';
import '../../../models/activity.model.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function delete;

  TripActivityList({this.activities, this.delete});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemBuilder: (context, index) {
        var activity = activities[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(activity.image),
            ),
            title: Text(activity.name),
            subtitle: Text(activity.city),
            trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.blue),
                onPressed: () {
                  delete(activity.id);
                  // SnackBar a besoin d'un context dans on va utiliser un Scaffold que lui va récupérer le context
                  // showSnackBar est une petite barre qui pop en bas de l'écran pour prévenir a l'utilisateur qu'il y a eu un changement
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Activité supprimée'),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 2),
                  ));
                }),
          ),
        );
      },
      itemCount: activities.length,
    ));
  }
}
