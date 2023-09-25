import 'package:flutter/material.dart';

class loginUser extends StatelessWidget {
  const loginUser({super.key});

  @override
  Widget build(BuildContext context) {

  // Personalizacion de la fuente de colores para el fondo
  final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio de Sesion"),
        centerTitle: true,
      ),
      // color de fondo de la aplicacion a desisicon de cada uno
      backgroundColor: Colors.white,

      //cuerpo de la aplicacion para agregar los componentes

      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20
        ),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //circulo para agregar la imagen que no shace falta}
              
              CircleAvatar(
                radius: 100.0,
                //color de fono para la imagen 
                backgroundColor: colors.primary,
                //agregar la imagen 
                backgroundImage: const AssetImage('assets/images/LogoGowPlay.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
