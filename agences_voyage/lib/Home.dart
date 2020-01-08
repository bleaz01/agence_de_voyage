import 'package:agences_voyage/city_card.dart';
import 'package:flutter/material.dart';

import 'city_card.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('Travel & Dream'),
        actions: <Widget>[Icon(Icons.more_horiz)],
      ),
      body: Container(
        padding: EdgeInsets.all(10.00),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[CartCity()],
        ),
      ),
    );
  }
}
