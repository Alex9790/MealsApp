import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  //Ruta a usar para llegar a eta pantalla
  static const routeName = "/meal-detail";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles $mealId"),
      ),
      body: Center(
        child: Text("Detalles de Recipe, Id: $mealId."),
      ),
    );
  }
}
