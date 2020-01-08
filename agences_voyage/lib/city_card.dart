import 'package:flutter/material.dart';

class CartCity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.00,
      child: Container(
        height: 160.00,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset('assets/images/paris.jpg', fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.all(10.00),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.star_border, size: 30, color: Colors.white),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text('Paris, France',
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
