import 'package:flutter/material.dart';
import '../../../models/city_model.dart';

class CartCity extends StatelessWidget {
  final City city;

  CartCity({this.city});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.00,
      child: Container(
          height: 160.00,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Ink.image(
                fit: BoxFit.cover,
                image: AssetImage(
                  city.image,
                ),
                child: InkWell(onTap: () {}),
              ),
              Positioned(
                  top: 10,
                  left: 10,
                  child: Text(city.name, style: TextStyle(color: Colors.white)))
            ],
          )),
    );
  }
}
