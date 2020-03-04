import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {@required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //argumento que agrega la funcionalidad al seleccionar este widget - redirigir a pagina de detalles
      onTap: selectMeal,
      //argumento donde se asigna el Widget que se qiere mostrar
      child: Card(
        //argumento para seleccionar la forma del Widget Card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        //efecto de sombra para simular elevacion
        elevation: 4,
        margin: EdgeInsets.all(10),
        //Widget a mostrar dentro de Card()
        child: Column(
          children: <Widget>[
            //para mostrar la imagen del recipe y sobre la imagen mostrar el titulo
            Stack(
              children: <Widget>[
                //widget que toma cualquier Widget y lo forza a ajustarse a una forma definida
                //se usara para darle esquinas redondeadas a la imagen, de lo contrario se sobrepondra a las esquinas definidas para Card()
                ClipRRect(
                  //.only pemite configurar cada esquinapor separado
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  //Widget que sera clipped(recortado)
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    //argumento que se usa para ajustar la imagen, BoxFit reajustara el tamaño y recortara la imagen a conveniencia
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
