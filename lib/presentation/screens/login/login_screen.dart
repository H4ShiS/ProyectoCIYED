import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 6, 30, 65),
              Color.fromARGB(255, 10, 62, 141),
              Color.fromARGB(255, 2, 70, 172),
            ]
          )
        ),
        child: ListView( // Cambiado a ListView
          children: <Widget>[

            const SizedBox(height: 5,),

             const Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),

                  child: Column(
                   children: [
                     Center(
                       child: Positioned(
                        top: 30, // Ajusta la posición vertical según tus necesidades
                        left:20, // Ajusta la posición horizontal según tus necesidades
                        child: CircleAvatar(
                          radius: 150, // Tamaño del avatar
                          backgroundColor: Color.fromARGB(255, 25, 19, 19), // Color de fondo
                          backgroundImage:  AssetImage('assets/images/logociyed.png'),
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

            const SizedBox(height: 10,),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(60), topLeft: Radius.circular(60))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[

                      const SizedBox(height: 60,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(255, 95, 27, 0.3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            )
                          ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey.shade200),
                                )
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: "Correo Electronico",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                                ),
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey.shade200),
                                )
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                                ),
                              ),
                            )

                          ],
                        ),

                      ),

                      const SizedBox(height: 50,),

                      Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromARGB(255, 202, 73, 4)
                        ),
                        child: const Center(
                          child: Text("Iniciar Sesion", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                        ),
                      ),

                      const SizedBox(height: 180,)
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