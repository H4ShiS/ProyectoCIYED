import 'package:flutter/material.dart';

import '../../widgets/Animatios/Animaciones.dart';

class FomrularioAlumno  extends StatelessWidget {
  static const formularioAlumno = "Formulario-Alumno";
  const FomrularioAlumno ({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 17, 5, 130),
        title: const  Text(
          "Registrar Alumno", 
          style: TextStyle(color: Colors.white),
        ),

        actions: [
            
            IconButton(
              onPressed: (){}, 
              icon: const Icon(
                Icons.format_list_bulleted_add, 
                color: Colors.white, size: 30,
              ),
              // style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
            
            ),

            const SizedBox(width: 15,),

          ],


        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded, // Icono de flecha de retroceso
              color:
                  Colors.white, // Cambia el color de la flecha de retroceso aquí
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

      ),

      body: FormularioAlumno(),

    );
  }
}


class FormularioAlumno extends StatelessWidget {


  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      
      physics: const BouncingScrollPhysics(),
      children: [
        Expanded(
          child: Container(
        
            
            // ... Resto del código ...
            child: Form(
        
        
              key: _keyForm,
              child: Column(
                children: [
                  Row(
                    
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Matricula")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.app_registration_rounded,
                                color: Color.fromARGB(255, 5, 78, 186),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
            
                              contentPadding: const EdgeInsets.symmetric(vertical: 5),
            
                              
                            ),
                          ),
                        ),
                      ),
            
                      const SizedBox(width: 10), // Espacio entre los campos
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Nia")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.web_outlined,
                                color: Color.fromARGB(255, 5, 78, 186),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 5),
            
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            
            
                  Row(
                    
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10,),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Nombre Alumno")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons. account_circle,
                                color: Color.fromARGB(255, 5, 78, 186),
                                
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
            
                              contentPadding: const EdgeInsets.symmetric(vertical: 5),
                              
                            ),
                          ),
                        ),
                      ),
            
            
                      const SizedBox(width: 10), // Espacio entre los campos
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Ape. Materno")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.person_rounded,
                                color: Color.fromARGB(255, 5, 78, 186),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 5),
            
                            ),
                          ),
                        ),
                      ),
            
                      
                    ],
                  ),
            
            // Espacio entre los campos
            
            
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 30),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Ape. Materno")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.person_2_rounded,
                                color: Color.fromARGB(255, 5, 78, 186),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            
            
                  Row(
                    
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label:
                                  FadeAnimation(1, const Text("Grupo ListCheck")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 5),
                            ),
                          ),
                        ),
                      ),
            
                      const SizedBox(width: 10), // Espacio entre los campos
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Ape. Materno")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.person_rounded,
                                color: Color.fromARGB(255, 0, 58, 146),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            
                  const SizedBox(
                    height: 50,
                  ),
            
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Nombre Tutor")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.account_circle,
                                color: Color.fromARGB(255, 5, 78, 186),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 5),
                            ),
                          ),
                        ),
                      ),
            
                      const SizedBox(width: 10), // Espacio entre los campos
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Ape. Materno")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.person_rounded,
                                color: Color.fromARGB(255, 5, 78, 186),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            
            
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 30
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Ape. Materno")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.person_2_rounded,
                                color: Color.fromARGB(255, 5, 78, 186),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 5),
                            ),
                          ),
                        ),
                      ),
            
                      const SizedBox(width: 10), // Espacio entre los campos
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Telefono")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.add_call,
                                color: Color.fromARGB(255, 5, 78, 186),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Telefono Opcional")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.call,
                                color: Color.fromARGB(255, 5, 78, 186),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 5),
                            ),
                          ),
                        ),
                      ),
            
                      const SizedBox(width: 10), // Espacio entre los campos
                      Expanded(
                        child: Container(
                         
                        ),
                      ),
                    ],
                  ),
        
        
                  Row(
                    children: [
                      Expanded(
                        child: Container(
        
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 30
                          ),
        
                         child: 
          
                         OutlinedButton.icon(
                            onPressed: () {},
                            icon: FadeAnimation(1, const Icon(Icons.person_add)),
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 23),
                                FadeAnimation(
                                    1,
                                    const Text(
                                      "Registrar Alumno 1s",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            style: ButtonStyle(
                              fixedSize:
                                  MaterialStateProperty.all(const Size(270, 40)),
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return const Color.fromARGB(255, 209, 218,
                                      226); // Cambia esto al color que desees para el highlightColor
                                  // Cambia esto al color que desees para el highlightColor
                                  // Cambia esto al color que desees para el highlightColor
                                }
                                return Colors
                                    .orange; // Por defecto, usa el overlayColor predeterminado
                              }),
                      
                              // backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 254, 68, 68)),
                            ),
                          ),
                                
                         
                         ),
                      ),
                    ],
                  )
            
            
                  // Resto de tus TextFormField aquí...
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

