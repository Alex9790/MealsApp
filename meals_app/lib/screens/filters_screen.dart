import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    //Widget que muestra un Switch con un texto anexo
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      //funcion para cambiar el valor del switch
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtros"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          //servira como titulo
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Ajustar la seleccion de Comidas.",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          //Widget que se asegura que el Widget hijo cubra tanto espacio como pueda, dentro de la Column/Row que lo contiene
          Expanded(
            child: ListView(
              //se usara el argumento children porque se sabe la cantidad de elementos que contendra la lista
              children: <Widget>[
                _buildSwitchListTile(
                  "Gluten-Free",
                  "Incluir solo Comidas Gluten-Free",
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegetarian",
                  "Incluir solo Comidas Vegetarianas",
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegan",
                  "Incluir solo Comidas Veganas",
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Lactose-Free",
                  "Incluir solo Comidas sin Lactosa",
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
