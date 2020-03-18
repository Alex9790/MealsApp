import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  //se reciben desde main la lista de comidas favoritas
  List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //se cambia esta lista a Map para intercambiar el titulo segun la Tab seleccionada
  List<Map<String, Object>> _pages;

  @override
  void initState(){
    super.initState();
    //se define _peages dentro de este metodo, para poder usar la propiedad "widget"
    _pages = [
    {
      "page": CategoriesScreen(),
      "title": "Categories",
    },
    {
      "page": FavoritesScreen(widget.favoriteMeals),
      "title": "Favorites",
    },
  ];
  }

  //indice utilizado para obtener el Widget de la lista
  int _selectedPageIndex = 0;

  //el parametro index es proveido automaticamente por Flutter, al referenciar esta funcion en el argumento "onTap" del Widget BottomNavigationBar()
  void _selectPage(int index) {
    //para realizar esta actualizacion de Widget, es la razn por la que e necesita Stateful Widget
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //el titulo varia segun el Tab seleccionado, acediendo al Map referenciado de la lista de Maps
        title: Text(_pages[_selectedPageIndex]["title"]),
      ),
      //forma de agregar Drawer
      drawer: MainDrawer(),
      //se toma el Widget seleccionado de la lista de Widgets dependiendo del indice que represente al Tab seleccionado
      body: _pages[_selectedPageIndex]["page"],
      //metodo para mostrar Tabs en el fondo de la pantalla
      bottomNavigationBar: BottomNavigationBar(
        //listener ejecutado cada vez que se selecciona un item
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        //le dice al BottomNavigationBar() cual es el Tab seleccionado, para que pueda aplicar los diferentes estilos definidos
        currentIndex: _selectedPageIndex,
        //agrega efecto de animacon al cambio de Tabs
        type: BottomNavigationBarType.shifting,
        //argumento que contiene los tabs definidos
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            title: Text("Categories"),
            //se le debe agregar en caso de aplicar una animacion en el argumento "type", se puede jugar con colores diferentes de background para cada Tab
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            title: Text("Favorites"),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
