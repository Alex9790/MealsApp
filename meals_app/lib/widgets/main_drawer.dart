import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(String title, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      //argumento que permite hacer click en el ListTile
      onTap: () {
        //accion a tomar para ir a otra pagina
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          //actuara como header del Drawer
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            //esta linea es equivalente a "decoration: BoxDecoration(color: )," si solo se quiere color esto es solo complicar las cosas
            color: Theme.of(context).accentColor,
            child: Text(
              "Cocinando!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          //a continuacion se configuraran los botones
          SizedBox(height: 20),
          buildListTitle("Comidas", Icons.restaurant),
          buildListTitle("Configuración", Icons.settings),
        ],
      ),
    );
  }
}
