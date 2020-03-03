import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Los Recipes"),
      ),
      body: Center(
        child: Text("Recipes para las Categorias."),
      ),
    );
  }
}
