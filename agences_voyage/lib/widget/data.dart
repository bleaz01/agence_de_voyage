import 'package:flutter/material.dart';
import '../models/activity.model.dart';
import '../datas/data.dart' as data;

//----------------------------------------------------------------//
//                          Note:                                 //
//                                                                //
// fichier Data nous permet de faire un widget InheriteWidget     //
// pour avoir les Donnés dans tout notre de projet. Cela est plus //
// facile quand des widgets enfants dépendent des widgets d'un    //
// niveau 2 à 5 supérieurs et voilà pourquoi ce fichier doit     //
// être au plus haut niveau                                       //
//----------------------------------------------------------------//

class Data extends InheritedWidget {
  final List<Activity> activities = data.activities;

  Data({
    Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldwildget) {
    return true;
  }

  static of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(Data);
  }
}
