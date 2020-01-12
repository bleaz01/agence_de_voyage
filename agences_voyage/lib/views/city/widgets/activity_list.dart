import 'package:agences_voyage/models/activity.model.dart';
import 'package:flutter/material.dart';

import 'activity_card.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> list;

  ActivityList({this.list});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      //crossAxisCount un instipensable car il nous permet de dire combiens d'element sur l'axe y et x
      children: list
          .map(
            (activity) => (ActivityCard(
              activity: activity,
            )),
          )
          .toList(),
    );
  }
}
