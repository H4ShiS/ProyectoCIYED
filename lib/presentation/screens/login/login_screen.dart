import 'package:app_ciyed/config/router/app_router.dart';
import 'package:app_ciyed/presentation/screens/admin/menu_admin/menu_admin.dart';
import 'package:app_ciyed/presentation/widgets/Animatios/Animaciones.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ignore: unused_import
import 'package:simple_animations/simple_animations.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;
    final formField = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passController = TextEditingController();
    bool passToggle = true;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          // Color.fromARGB(255, 6, 30, 65),
          // Color.fromARGB(255, 10, 62, 141),
          // Color.fromARGB(255, 2, 70, 172),

          Color.fromARGB(255, 199, 51, 6),
          Color.fromARGB(255, 215, 75, 33),
          Color.fromARGB(255, 241, 96, 52),
        ])),
        child: ListView(
          // Cambiado a ListView
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),

            const Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),

                  child: Column(
                    children: [
                      Center(
                        child: Positioned(
                          top:
                              30, // Ajusta la posición vertical según tus necesidades
                          left:
                              20, // Ajusta la posición horizontal según tus necesidades
                          child: CircleAvatar(
                            radius: 130, // Tamaño del avatar
                            backgroundColor: Color.fromARGB(
                                255, 255, 255, 255), // Color de fondo
                            backgroundImage:
                                AssetImage('assets/images/logociyed.png'),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // child:
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: <Widget>[
                  //     Text(
                  //       "Login screen",
                  //       style: TextStyle(color: Colors.white, fontSize: 40),
                  //     ),
                  //     SizedBox(
                  //       height: 10,
                  //     ),
                  //     Text(
                  //       "Step",
                  //       style: TextStyle(color: Colors.white, fontSize: 18),
                  //     ),
                  //   ],
                  // ),
                ),
              ],
            ),

            // FloatingActionButton(onPressed: (){},
            //     backgroundColor: Colors.blue, child: const Icon(Icons.add),),

            const SizedBox(
              height: 10,
            ),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 20,
                        offset: Offset(5, 10),
                      )
                    ]),

                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                      ),

                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 243, 231, 231),
                                blurRadius: 15,
                                offset: Offset(1, 5),
                              )
                            ]),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                
                                label: FadeAnimation(1, const Text("Correo Electronico")),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Color.fromARGB(255, 6, 30, 65),
                                ),
                                labelStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 6, 30, 65),
                                ),
                                // filled: true,
                                // fillColor:Color.fromARGB(255, 6, 30, 65),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                              controller: passController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  label: FadeAnimation(1, const Text("Password")),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Color.fromARGB(255, 4, 45, 106),
                                  ),
                                  labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 4, 45, 106),
                                    fontSize: 15,
                                  ),
                                  suffix: InkWell(
                                    onTap: () {
                                      setState(() {
                                        passToggle = !passToggle;
                                      });
                                    },
                                    // ignore: dead_code
                                    child: Icon(passToggle
                                        ? Icons.visibility
                                        // ignore: dead_code
                                        : Icons.visibility_off),
                                  )),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 50,
                      ),

                      InkWell(
                        onTap: () {
                          context.pushNamed(MenuAdmin.menuAdmin);
                        },
                        
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 5, 73, 175),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  
                                  color: Color.fromARGB(255, 159, 151, 193),
                                  blurRadius: 10,
                                  offset: Offset(2, 5),

                                )
                              ]),
                          child:  Center(
                            child: FadeAnimation(
                              1, const Text(
                                "Iniciar Sesion",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),



                      // Container(
                      //   height: 50,
                      //   margin: const EdgeInsets.symmetric(horizontal: 50),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(50),
                      //     color: const Color.fromARGB(255, 202, 73, 4)
                      //   ),
                      //   child: const Center(
                      //     child: Text("Iniciar Sesion", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                      //   ),
                      // ),

                      const SizedBox(
                        height: 150,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
        child: Column(
          children: <Widget>[
             const SizedBox(height: 80,),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [

                  Text("Login screen", style: 
                    TextStyle(color:  Colors.white, fontSize: 40),
                  ),
                ],
              ),
            ),
            
            

            const SizedBox(height: 20,),

            Expanded(
              child: Container(
                height: 20,
                color: Colors.white,
                
              )
            )


          ],
        ),
*/
