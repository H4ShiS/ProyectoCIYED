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

              const SizedBox(height: 20,),


              // const Text(
              //   "Login",
              //   style: TextStyle(),
              // ),

              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  hintText: "Correo Electronico"
                ),   
              ),


              const SizedBox(height: 20,),


              TextField(
                decoration: InputDecoration(
                  
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  hintText: "Contraseña"
                ),   
              ),

              const SizedBox(height: 20,),

              InkWell(
                borderRadius: BorderRadius.circular(15.0), // Establecer el radio de borde
                onTap: () {
                  // Manejar el evento de pulsación
                },
                child: Material(
                  borderRadius: BorderRadius.circular(15.0), // También puedes aplicar el radio de borde al Material
                  color: Colors.lightBlue,
                  child: const SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: Center(
                      child: Text(
                        'Inicio Sesion',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )


            ],
          )
        ],
      ),
    );
  }
}
