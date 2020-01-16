import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../datas/trip.dart';

class Overview extends StatelessWidget {
  final Function setDate;
  final Trip mytrip;
  final String cityName;
  final double amount;

  Overview({this.setDate, this.mytrip, this.amount, this.cityName});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      width:
          orientation == Orientation.landscape ? size.width * 0.5 : size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            cityName,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(mytrip.date != null
                    ? DateFormat("d/M/y").format(mytrip.date)
                    : 'choisissez une date'),
              ),
              //DateFormat vient d'un package externe 'intl' qui nous permets de convertire entre autre les dates (Datetime)
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
                child: Text(
                  'Montant / personne',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                child: Text(
                  '$amount EURO',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
