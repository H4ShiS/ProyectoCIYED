import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class LoginUser extends StatelessWidget {
  const LoginUser({Key? key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const _BackgroundBubbles(), // Agregado de burbujas de fondo
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 140.0,
                    backgroundColor: colors.primary,
                    backgroundImage:
                        const AssetImage('assets/images/logociyed.png'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _pruebasGuion(colors),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _pruebasGuion(ColorScheme colors, ) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          decoration: BoxDecoration(
            
            color: const Color.fromARGB(255, 250, 244, 244),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
            
              BoxShadow(
                color: Colors.black26,
                blurRadius: 15,
                offset: Offset.zero,
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: "Correo Electronico",
                  prefixIcon: const Icon(
                    Icons.email,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: "Contraseña",
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15.0),
                onTap: () {
                  // Manejar el evento de pulsación

                  GoRouter.of(context).go('/');                  
                },
                child: Material(
                  borderRadius: BorderRadius.circular(15.0),
                  color: colors.secondary,
                  child: Ink(
                    width: 150.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Iniciar Sesión',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _BackgroundBubbles extends StatelessWidget {
  const _BackgroundBubbles({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
         Positioned(
            // top: index * 50.0,
            // left: index % 2 == 0 ? 50 : 200,
            top: -30,
            left: 190,
            child: Opacity(
              opacity: 0.09,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromARGB(248, 109, 24, 199),
                ),
              ),
            ),
          ),


          Positioned(
            // top: index * 50.0,
            // left: index % 2 == 0 ? 50 : 200,
            top: 150,
            left: -50,
            child: Opacity(
              opacity: 0.09,
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(250),
                  color: Color.fromARGB(248, 109, 24, 199),
                ),
              ),
            ),
          ),



          Positioned(
            // top: index * 50.0,
            // left: index % 2 == 0 ? 50 : 200,
            top: 650,
            left: 60,
            child: Opacity(
              opacity: 0.09,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromARGB(248, 109, 24, 199),
                ),
              ),
            ),
          ),


          Positioned(
            // top: index * 50.0,
            // left: index % 2 == 0 ? 50 : 200,
            top: 565,
            left: 285,
            child: Opacity(
              opacity: 0.09,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromARGB(248, 38, 4, 199),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
