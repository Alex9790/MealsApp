import 'package:flutter/foundation.dart'; //nos permite incluir la notacion "@required" para los argumentos del constructor

//Automaticamente se mapea un entero a cada enum 0 = Simple, 1 = Challenging y 2 = Hard
enum Complexity {
  Simple,
  Challenging,
  Hard
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({@required this.id, @required this.categories, @required this.title, @required this.imageUrl, @required this.ingredients, 
        @required this.steps, @required this.duration, @required this.complexity, @required this.affordability, @required this.isGlutenFree, 
        @required this.isLactoseFree, @required this.isVegan, @required this.isVegetarian});
}