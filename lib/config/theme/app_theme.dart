import 'package:flutter/material.dart';

// est clase se va a ocupar para lo que es la combinacion de colores, se
 var colorList = <Color>[

  //mi lista de colores
  // Color.fromARGB(251, 245, 78, 36),
    const Color.fromRGBO(28, 4, 125, 1),
                  // Color.fromRGBO(255, 70, 31, 228),

      // Color.fromARGB(255, 14, 14, 74),

     const Color.fromRGBO(210, 42, 12, 0.122),
    // Color.fromARGB(250, 255, 64, 0),
    Colors.orangeAccent.shade400,
    const Color.fromARGB(255, 101, 5, 118),





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