import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/categories-meals";

  /*final String categoryId;
  final String categoryTitle;
  CategoryMealsScreen(this.categoryId, this.categoryTitle);
  */

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs["id"];
    final categoryTitle = routeArgs["title"];
    //Sera una lista de Meals que contentra los recipes que en su lista de categorias contengan la categoria selecciona (para filtrar)
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(title: categoryMeals[index].title, imageUrl: categoryMeals[index].imageUrl, 
                          duration: categoryMeals[index].duration, complexity: categoryMeals[index].complexity, 
                          affordability: categoryMeals[index].affordability);
        },
        //argumento para definir dinamicamente la cantidad de elementos que contendra la lista
        itemCount: categoryMeals.length,
      ),
    );
  }
}
