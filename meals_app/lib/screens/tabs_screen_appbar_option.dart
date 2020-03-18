import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    //metodo para mostrar Tabs debajo del AppBar
    return DefaultTabController(
      //cantidad de Tabs
      length: 2,
      //definir la Tab por defecto
      initialIndex: 0,
      //contiene Scaffold que asu vez configura las Tabs ubicadas debajo del Appbar
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          bottom: TabBar(
            //crea tantos Tab() Widgets como definidos en el argumento "length"
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favorites",
              ),
            ],
          ),
        ),
        //se agregan tantos como definidos en el argumento "length" //el orden de los tabs definidos aqui deben estar emparejados con los definidos en TabBar()
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            //FavoritesScreen(),  se comenta para que no de error
          ],
        ),
      ),
    );
  }
}
