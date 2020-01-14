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
                }),
          ),
        );
      },
      itemCount: activities.length,
    ));
  }
}
