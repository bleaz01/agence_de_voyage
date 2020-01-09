import 'package:flutter/material.dart';
import '../../../models/activity.model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  ActivityCard({this.activity});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      width: double
          .infinity, // double.infinty permet que le container prenne tout espace disponible

      child: Image.asset(activity.image, fit: BoxFit.cover),
    );
  }
}
