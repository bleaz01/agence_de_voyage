import 'package:agences_voyage/models/activity.model.dart';
import 'package:flutter/material.dart';

import 'activity_card.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> list;
  final Function toogleActivities;
  final List<String> selectedActivities;

  ActivityList({this.list, this.selectedActivities, this.toogleActivities});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      //crossAxisCount un indispensable car il nous permet dire combien d'element sur l'axe x
      children: list
          .map(
            (activity) => (ActivityCard(
                activity: activity,
                isSelected: selectedActivities.contains(activity.id),
                toogleActivities: () {
                  toogleActivities(activity.id);
                })),
          )
          .toList(),
    );
  }
}
