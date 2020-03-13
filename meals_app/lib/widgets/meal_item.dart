import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  //funcion para eliminar temporalmente una comida
  final Function removeItem;


  MealItem(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.removeItem});

  //metodo GET para convertir los Enums en texto que sea significativo para un usuario
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "Unknown";
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    ).then((result){
      if(result != null){
        removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //argumento que agrega la funcionalidad al seleccionar este widget - redirigir a pagina de detalles
      onTap: () => selectMeal(context),
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
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  //se encapsula en Container para que no se pierda el titulo en los bordes
                  child: Container(
                    width: 300,
                    //agregar un background un poco transparente
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      //evita que en caso de que el texto sea muy largo, sobresalga del espacio definido
                      softWrap: true,
                      //en caso de q el texto sobrepase el borde, aplica un efecto de desvanecer
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            //informacion debajo de la imagen de los recipes
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //cada item del Row estara compuesto por icono y texto
                  /**Duracion */
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      //separar un poo el Icono del Texto
                      SizedBox(
                        width: 6,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  /**Complexity */
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  /**Affordability */
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
