import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  String title;
  Color color;

  CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      //se agrgea un poco de optimizacion agregando "const"
      padding: const EdgeInsets.all(15),
      child: Text(title, style: Theme.of(context).textTheme.title,),
      //estilizando el Background
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.7), color],
          //direccion en la que se aplica el gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        //suavizar las esqinas / borde redondo
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}
