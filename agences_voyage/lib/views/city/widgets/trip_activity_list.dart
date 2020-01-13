import 'package:flutter/material.dart';
import '../../../models/activity.model.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;

  TripActivityList({this.activities});

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
            trailing: Icon(Icons.delete),
          ),
        );
      },
      itemCount: activities.length,
    ));
  }
}
