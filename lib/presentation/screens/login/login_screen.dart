// ignore_for_file: avoid_print, curly_braces_in_flow_control_structures, use_build_context_synchronously, unused_local_variable, no_leading_underscores_for_local_identifiers, unused_import, body_might_complete_normally_nullable, empty_statements

import 'package:app_ciyed/config/router/app_router.dart';
import 'package:app_ciyed/presentation/screens/admin/menu_admin.dart';
import 'package:app_ciyed/presentation/screens/docente/menu_docente.dart';
import 'package:app_ciyed/presentation/widgets/Animatios/Animaciones.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  bool _isSecurity = true;
  final formField = GlobalKey<FormState>();
  final _keyForm = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            physics: const BouncingScrollPhysics(), 
            children: [
            Form(
              key: _keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/op.png",
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    "",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 17, 5, 130)),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      // color: const Color.fromARGB(255, 17, 5, 130),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            RegExp regex = RegExp(
                                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                            if (!regex.hasMatch(value)) {
                              return "Ingresa un correo electrónico válido";
                            }
                          } else {
                            return "Ingresa el Email";
                          }
                          return null;
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: FadeAnimation(
                              1, const Text("Correo electronico")),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon: const Icon(Icons.mark_email_unread,
                              color: Color.fromARGB(255, 17, 5, 130)),
                          labelStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 17, 5, 130),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      // color: const Color.fromARGB(255, 17, 5, 130),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: TextFormField(
                        obscureText: _isSecurity,
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                          } else {
                            return "Ingresa la contraseña";
                          }
                        },
                        controller: passController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          label: FadeAnimation(1, const Text("Contraseña")),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_person_rounded,
                            color: Color.fromARGB(255, 17, 5, 130),
                          ),
                          labelStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 17, 5, 130),
                          ),

                          // suffixIcon: tooglePassword()//esto es un metodo generado abajo
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isSecurity =
                                    !_isSecurity; // Cambio de _isSecurity al presionar el botón
                              });
                            },
                            icon: _isSecurity
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            color: Colors.grey,
                          ),

                        ),
                      ),
                    ),
                  ),
/*
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: (){

                      },
                      child: const Text("Contraseña olvidada"),

                    ),
                  ),
*/
                  const SizedBox(
                    height: 15,
                  ),

                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: const Color.fromARGB(255, 17, 5, 130),
                          onPressed: () async {
                            // context.pushNamed(MenuAdmin.menuAdmin);
                            if (_keyForm.currentState != null &&
                                _keyForm.currentState!.validate()) {
                              String email = emailController.text;
                              String pass = passController.text;

                              var response = await http.post(Uri.parse('https://pruebas97979797.000webhostapp.com/apis/sesion/sesion.php'),
                                body:{
                                  'email': email,
                                  'pass': pass
                                }
                              );

                              if (response.statusCode == 200) {
                                // Map<String, dynamic> responseData = json.decode(response.body);
                                List<dynamic> responseData =
                                    json.decode(response.body);
                                for (var item in responseData) {
                                  String idRol = item['id_rol'];

                                  if (idRol == "2") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MenuDocente(
                                            id: item['id'],
                                            nombre: item['nombre'],
                                            appaterno: item['appaterno'],
                                            apmaterno: item['apmaterno'],
                                            recordatorio: item['recordatorio'],
                                          ),
                                        ));
                                        
                                  } else if (idRol == "1") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const MenuAdmin(
                                              // id: item['nombre']
                                              ),
                                        ));

                                    print(responseData);

                                    
                                  } else {
                                    print("Error 500");
                                  }
                                  emailController.clear();
                                  passController.clear();
                                  
                                }
                              }
                            }
                            // context.pushNamed(MenuAdmin.menuAdmin);
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Text(
                              "Iniciar Sesión",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 104, 23, 219),
                        ))
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.2),
                                  offset: const Offset(0, 5),
                                  blurRadius: 10,
                                )
                              ]),
                          child: Image.asset(
                            "assets/images/face.png",
                            height: 55,
                          ),
                        )),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.2),
                                  offset: const Offset(0, 5),
                                  blurRadius: 10,
                                )
                              ]),
                          child: Image.asset(
                            "assets/images/google.png",
                            height: 35,
                          ),
                        )),
                        const SizedBox(width: 20),
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.2),
                                  offset: const Offset(0, 5),

                                  blurRadius: 10,
                                )
                              ]),
                          child: Image.asset("assets/images/insta.png",
                              height: 50),
                        )),
                        const SizedBox(width: 20),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );

  }

  Widget tooglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isSecurity = !_isSecurity;
          });
        },
        icon: _isSecurity
            ? const Icon( Icons.visibility)
            : const Icon(Icons.visibility_off),
            color: Colors.grey,
    );
  }
  
}


/*
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              ListView(
                physics: const BouncingScrollPhysics(),
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
                                top: 30, // Ajusta la posición vertical según tus necesidades
                                left: 20, // Ajusta la posición horizontal según tus necesidades
                                child: CircleAvatar( 
                                  radius: 130, // Tamaño del avatar
                                  backgroundColor: Color.fromARGB(255, 255, 255, 255), // Color de fondo
                                  backgroundImage: AssetImage('assets/images/logociyed.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
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
                  
                            Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value != null && value.isNotEmpty) {
                                      RegExp regex = RegExp(
                                          r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                                      if (!regex.hasMatch(value)) {
                                        return "Ingresa un correo electrónico válido";
                                      }
                                    } else {
                                      return "Ingresa el Email";
                                      
                                    }
                                    return null;
                                  },
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    label: FadeAnimation(
                                        1, const Text("Correo Electronico")),
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
                                  validator: (value) {
                                    if (value != null && value.isNotEmpty) {
                                    } else {
                                      return "Ingresa la contraseña";
                                    }
                                  },
                                  controller: passController,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      label:
                                          FadeAnimation(1, const Text("Password")),
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
                                            // passToggle = !passToggle;
                                          });
                                        },
                                        // ignore: dead_code
                                        /*child: Icon(
                                          // passToggle
                                            // ? Icons.visibility
                                            // ignore: dead_code
                                            // : Icons.visibility_off
                                            ),
                                            */
                                      )
                                    ),
                                )
                              ],
                            ),
                  
                            const SizedBox(
                              height: 50,
                            ),
                  
                            InkWell(
                              onTap: () async {
                                     
                                if (_keyForm.currentState != null && _keyForm.currentState!.validate()) {
                                  String email = emailController.text;
                                  String pass = passController.text;
                            
                                  var response = await http.post(Uri.parse('https://pruebas97979797.000webhostapp.com/apis/sesion/sesion.php'),
                                    body: {
                                      'email': email,
                                      'pass': pass,
                                    }
                                  ); 
                            
                                  if (response.statusCode == 200) {
                                    // Map<String, dynamic> responseData = json.decode(response.body);
                                    List<dynamic> responseData = json.decode(response.body);
                                      for (var item in responseData) {
                                        String idRol = item['id_rol'];
                            
                                        if (idRol == "2") {
                                          Navigator.push(context, MaterialPageRoute(
                                              builder: (context) => MenuDocente(
                                                id: item['id'],
                                                nombre: item['nombre'],
                                                appaterno: item['appaterno'],
                                                apmaterno: item['apmaterno'],
                                                recordatorio: item['recordatorio'],
                                              ),
                                            )
                                          );
                                        } else if(idRol == "1"){
                                          Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => const MenuAdmin(
                                              // id: item['nombre']
                                            ),
                                          ));
                                        };
                                         // Accede a los elementos de la lista directamente
                                      }
                                      print(responseData);
                            
                                      emailController.clear();
                                      passController.clear();
                                      
                                    } else {
                                      print("Error 500");
                                  }
                                
                                // context.pushNamed(MenuAdmin.menuAdmin);
                  
                                }
                                // */
                              /*},
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 17, 5, 130),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 159, 151, 193),
                                        blurRadius: 10,
                                        offset: Offset(2, 5),
                                      )
                                    ]),
                                child: Center(
                                  child: FadeAnimation(
                                    1,
                                    const Text(
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
                              height: 150, //cambiar a 150
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
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
