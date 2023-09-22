import 'package:app_ciyed/src/widgets/icon_contaliner.dart';
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
      backgroundColor: Colors.amber,

      //cuerpo de la aplicacion para agregar los componentes
      //se usaran lo que es el log de la escuela 
      //campos para rellenar lo que es el correo y contraseña
      //tambien el boton para poder acceder al menu correspondiente
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20
        ),
        children: const [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //circulo para agregar la imagen que no shace falta
              CircleAvatar(
                radius: 100.0,
                //color de fono para la imagen 
                backgroundColor: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
