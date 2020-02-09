import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class TripsView extends StatefulWidget {
  static String routeName = '/trips';

  @override
  _TripsViewState createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mes Voyages'),
        ),
        drawer: MyDrawer(),
        body: Container(
          child: Text('mes voyages'),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            title: Text('voyage'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            title: Text('voyage'),
          ),
        ]),
      ),
    );
  }
}
