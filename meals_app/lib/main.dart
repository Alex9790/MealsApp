import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //para almacenar cuales filtros uso el usuario
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    //se actualizan los valores del map, cuado esta funcion callback se ejecuta desde filters_screen
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        //si estoy filtrando por gluten, pero meal no es gluten, entonces descarto meal
        if (_filters["gluten"] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"] && !meal.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  //metodo para agregar/eliminar una comida de favoritos
  void _toggleFavorite(String mealId) {
    //retorna el index del elemento que cumpla con la condicion
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      //en caso de conseguir el elemento en la lista se elimina
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      //en caso de no conseguir elemento significa que se quiere agregar a favoritos
      //se usa DUMMY_MEALS porque _availableMeals se vera afectada por los filtros
      //.firstWhere() para que devuelva solo un elemento (el primero) que cumpla la condicion
      _favoriteMeals.add(
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
      );
    }
  }

  //metodo para verificar si un Meal esta ya identificado como favorito o no
  bool _isMealFavorite(String id){
    //equivalente al metodo .has que tienen las listas en java, donde retorna true/false si se encuentra algun elemento que cumpla la condicion
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        //seteando el tema del texto, pero agregando configuraciones particulares
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
      ),
      //home: CategoriesScreen(),
      initialRoute: "/",
      routes: {
        //ruta por defecto
        "/": (ctx) => TabsScreen(_favoriteMeals),
        //se envian la lista ya filtrada
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        //se envia funcion callback, para agregar/eliminar la comida en la listade favoritos
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        //se envian los filtros actualmente aplicados y la funcion para actualizarlos
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      //agumento para routes generados dinamicamente
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
      //ruta por defecto en caso de que todo salga mal por alguna razon
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
