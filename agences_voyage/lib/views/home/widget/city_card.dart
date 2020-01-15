import '../../../widget/data.dart';
import 'package:flutter/material.dart';
import '../../../models/city_model.dart';
import '../../city/city_view.dart';

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
                child: InkWell(onTap: () {
                  Navigator.pushNamed(context, '/city', arguments: city);
                  // Navigator.push(
                  //   //Navigator.push nous permets de rajouté un widget sur la stack(autre widget)
                  //   context, //la navigation dois avoir le context pour savoir qu'elle widget et visible par l'utilisateur(widget le plus haut de la stack)
                  //   MaterialPageRoute(builder: (context) {
                  //     //MaterialPageRoute nous permets de faire une transition entre les routes
                  //     return Data(child: CityView());
                  //   }),
                }),
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
