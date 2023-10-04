import 'package:flutter/material.dart';

// est clase se va a ocupar para lo que es la combinacion de colores, se
 var colorList = <Color>[

  //mi lista de colores
  Color.fromARGB(255, 11, 1, 71),

  Color.fromARGB(255, 13, 3, 71),
  Color.fromARGB(255, 246, 38, 38),
  Color.fromARGB(255, 244, 111, 54),
  //colores secundarios y opcionales
  Color.fromARGB(255, 224, 133, 54),
  Color.fromARGB(255, 5, 18, 61),
];



//mi clase de AppTheme queo se va a ocupar en las clase
class AppTheme{


  final int selectColor;
   
   // condicional para que se seleccione cada color 
  AppTheme({
    this.selectColor = 0
  }): assert(selectColor >= 0, "selecciona otro color"),
      assert(selectColor <= colorList.length, "selecciona otro numero menor a 5");

// retorno del metodo para que se use el material
  ThemeData getTheme()=> ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectColor]
  );
}