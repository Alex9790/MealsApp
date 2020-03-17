import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/categories-meals";

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  //usado para evitar que didChangeDependencies() afecte varias veces los cambios realizados
  bool _loadedInitData = false;

  //se ejecuta cuando se crea este Widget
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //en caso de necesitar usar context, se debe usar el metodo didChangeDependencies() en vez de initState(), porque context aun no se encuentra definido
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("AQUI");
    if(!_loadedInitData){
      print("AQUI2");
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs["id"];
      categoryTitle = routeArgs["title"];
      //Sera una lista de Meals que contentra los recipes que en su lista de categorias contengan la categoria selecciona (para filtrar)
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
  }

  void _removeMeal(String mealId) {
    //elimina dentro de la lista de meals el que tenga el mealId recibido en el pop()
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
/*    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs["id"];
    categoryTitle = routeArgs["title"];
    //Sera una lista de Meals que contentra los recipes que en su lista de categorias contengan la categoria selecciona (para filtrar)
    displayedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
*/    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        //argumento para definir dinamicamente la cantidad de elementos que contendra la lista
        itemCount: displayedMeals.length,
      ),
    );
  }
}
