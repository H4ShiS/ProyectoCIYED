import 'package:flutter/material.dart';

import '../../../widgets/Animatios/Animaciones.dart';

class FomrularioDocente  extends StatelessWidget {
  static const formularioDocente = "Formulario-Docente";
  const FomrularioDocente ({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 17, 5, 130),
          toolbarHeight: 80,
        title: const  Text(
          "Registrar Docente", 
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

        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15), 
              bottomRight: Radius.circular(15),
            )
          ),

      ),

      body: FormularioMateriaTextField(),

    );
  }
}


class FormularioMateriaTextField extends StatelessWidget {
   FormularioMateriaTextField({super.key});
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
                            // validator: (valor) {
                            //   if (valor != null && valor.isEmpty) {
                                
                            //     return "Ingresa la Matricula";
                            //   }
                            //   return null;
                            // },
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
                            // validator: (value) {
                            //   if (value != null && value.isNotEmpty) {
                            //      RegExp nombreTutor = RegExp(r'[a-zA-Z\s]$');

                            //      if (!nombreTutor.hasMatch(value)) {
                            //        return "Solo letras";
                            //      }
                            //   }else {

                            //     return "Ingresa el Nombre ";
                            //   }

                            
                            // },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Nombre Docente")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.account_circle_rounded,
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
                          margin: const EdgeInsets.symmetric(horizontal: 15,),
                          child: TextFormField(
                            // validator: (value) {
                            //   if (value != null && value.isNotEmpty) {
                            //     RegExp apellidoPaterno =  RegExp(r'^[a-zA-Z\s]+$');

                            //     if (!apellidoPaterno.hasMatch(value)) {
                                  
                            //       return "Solo letras";
                            //     }
                            //   }  else {

                            //     return "Ingresa el dato";
                            //   }
                                      
                            //   return null;
                            // },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Ape. Paterno")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons. person,
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
                            // validator: (value) {
                              
                            //   if (value != null && value.isNotEmpty) {

                            //   RegExp apellidoM = RegExp(r'^[a-zA-Z\s]+$');
                            //     if (!apellidoM.hasMatch(value)) {

                            //       return "Solo letras";
                            //     }
             
                            //   } else {

                            //     return "Ingresa el Dato";
                            //   }

                            //   return null;

                            // },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Ape. Materno")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.person_2,
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
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 30
                          ),
                          child: TextFormField(
                            // validator: (value) {
                            //   if (value != null && value.isNotEmpty) {
                            //     RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                            //     if (!regex.hasMatch(value)) {
                            //       return "Ingresa un correo electrónico válido";
                            //     }
                                
                            //   } else {
                            //     return "Ingresa el Email";
                            //   }

                            //   return null;
                            // },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              label:
                                  FadeAnimation(1, const Text("Email")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.email,
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
                          margin: const EdgeInsets.only(right: 15),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Contraseña")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
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
                              horizontal: 15,),
                          child: TextFormField(
                            // validator: (value) {
                            //   if (value != null && value.isNotEmpty) {
                            //     return "Ingresa el Nombre";
                            //   } else {
                            //     // // Otras condiciones de validación
                            //     // if (value == null) {
                            //     //   return "El valor no cumple con los requisitos";
                            //     // }
                            //     return "Validacion";
                            //   }

                              
                            // },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Recado")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons.message,
                                color: Color.fromARGB(255, 5, 78, 186),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            
            
           
                  const SizedBox(
                    height: 20,
                  ),
      
        
                  Row(
                    children: [
                      Expanded(
                        child: Container(
        
                          margin: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 40
                          ),
        
                         child: 
          
                         OutlinedButton.icon(
                            onPressed: () {
                              if (_keyForm.currentState != null && _keyForm.currentState!.validate()) {

                                print("Validacion Exitosa");
                                
                              } else{

                                print("Validacion no Exitosa");
                              }
                            },
                            icon: FadeAnimation(1, const Icon(Icons.person_add, color: Colors.white,)),
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 10),
                                FadeAnimation(
                                    1,
                                    const Text(
                                      "Registrar Docente",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                        ),
                                          
                                    )),
                              ],
                            ),
                            style: ButtonStyle(
                              fixedSize:
                                  MaterialStateProperty.all(const Size(270, 52)),
                              
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Color.fromARGB(255, 239, 68, 20);
                                  
                                }
                                return Color.fromARGB(255, 48, 8, 206); // Por defecto, usa el overlayColor predeterminado
                              }),
                      
                               backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 17, 5, 130)),
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



/*validator: (value) {
  if (value != null && value.isNotEmpty) {
    // El campo tiene un valor escrito
    if (/* Otra condición que debes validar */) {
      // Otra validación también es exitosa
      return null; // El valor es válido
    } else {
      return "Otra validación no es exitosa"; // Devuelve un mensaje de error
    }
  } else {
    return null; // El campo está vacío pero es válido
  }
},*/