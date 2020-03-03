import 'package:flutter/material.dart';

import './category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  String title;
  Color color;

  CategoryItem(this.title, this.color);

  void selectCategory(BuildContext context) {
    //clase de Flutter cuya funcionalidad es el paso de pantallas
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          //recibe context de parametro, pero como no se usa se ignora con "_"
          return CategoryMealsScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //metodo donde se pasara de pantalla, necesita el context de la App
      onTap: () => selectCategory(context),
      //ripple effect, defines el color de las olas
      splashColor: Theme.of(context).primaryColor,
      //asegurarse que sea el mismo BorderRadius que el del Container(), para que las olas se animen correctamente
      borderRadius: BorderRadius.circular(15),
      child: Container(
        //se agrgea un poco de optimizacion agregando "const"
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        //estilizando el Background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            //direccion en la que se aplica el gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          //suavizar las esqinas / borde redondo
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
