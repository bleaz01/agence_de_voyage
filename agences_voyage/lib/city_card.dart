import 'package:flutter/material.dart';

class CartCity extends StatelessWidget {
  final String name;
  final String image;
  final bool checked;
  final Function updateChecked;

  CartCity({this.name, this.image, this.checked, this.updateChecked});

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
                image,
              ),
              child: InkWell(onTap: updateChecked),
            ),
            Padding(
              padding: EdgeInsets.all(10.00),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(checked == true ? Icons.star : Icons.star_border,
                            size: 30, color: Colors.white),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(name,
                          style:
                              TextStyle(color: Colors.white, fontSize: 30.00))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
