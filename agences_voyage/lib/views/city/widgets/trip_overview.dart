import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../datas/trip.dart';

class Overview extends StatelessWidget {
  final Function setDate;
  final Trip mytrip;

  double get amount {
    return 0;
  }

  Overview({this.setDate, this.mytrip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Paris',
            style:
                TextStyle(fontSize: 30, decoration: TextDecoration.underline),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Expanded(child: Text(DateFormat("d/M/y").format(mytrip.date))),
              //DateFormat vient d'un package externe intl qui nous permet de convertire entre autre les date (Datetime)
              RaisedButton(
                  child: Text('Slectionner une date'), onPressed: setDate)
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Text('Montant / personne',
                      style: TextStyle(fontSize: 20))),
              Text('$amount',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}
