import 'package:flutter/material.dart';
import '../../../models/activity.model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final Function toogleActivities;
  final bool isSelected;

  ActivityCard({this.activity, this.toogleActivities, this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      width: double
          .infinity, // double.infinty permets que le container prenne tout espace disponible

      child: Stack(
        children: <Widget>[
          Ink.image(
            image: AssetImage(activity.image),
            fit: BoxFit.cover,
            child: InkWell(
              onTap: toogleActivities,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (isSelected) Icon(Icons.check, color: Colors.white)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        activity.name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '${activity.prix} €',
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Colors.white, backgroundColor: Colors.grey[700]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
