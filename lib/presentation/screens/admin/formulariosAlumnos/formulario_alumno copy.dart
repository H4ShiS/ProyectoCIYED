// ignore_for_file: body_might_complete_normally_nullable, avoid_print, unnecessary_new

import 'package:flutter/material.dart';

import '../../../widgets/Animatios/Animaciones.dart';

class FomrularioAlumno  extends StatelessWidget {
  static const formularioAlumno = "Formulario-Alumno";
  const FomrularioAlumno ({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 17, 5, 130),
          toolbarHeight: 80,
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

        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15), 
              bottomRight: Radius.circular(15),
            )
          ),

      ),

      body: FormularioAlumnoTextfield(),

    );
  }
}

// ignore: must_be_immutable
class FormularioAlumnoTextfield extends StatefulWidget {
   FormularioAlumnoTextfield({super.key});

  @override
  State<FormularioAlumnoTextfield> createState() => _FormularioAlumnoTextfieldState();
}

class _FormularioAlumnoTextfieldState extends State<FormularioAlumnoTextfield> {
  List<String> listaDeGrupo = ["A","B"];
  List<String> listaDeSemestre = ["1", "2", "3", "4", "5", "6"];
  TextEditingController matricula = TextEditingController();
  TextEditingController nia = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController appaterno = TextEditingController();
  TextEditingController apmaterno = TextEditingController();
  TextEditingController nombreTutor = TextEditingController();
  TextEditingController appaternoTutor = TextEditingController();
  TextEditingController apmatertoTutor = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController telefonoOpcional = TextEditingController();

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

  int grupoSelected = 0;

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

                      const SizedBox(width: 80,), // Espacio entre los campos

                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15,),
                          child: DropdownButtonFormField(
                            
                            items: listaDeSemestre.map((name) {
                              
                              return DropdownMenuItem(
                                
                                value: name,
                                child: Text(name),
                                );
                            }).toList(), 
                            onChanged: (String? value) { 
                              print(value);
                            },

                            validator: (value) {

                              if (value == null || value.isEmpty) {


                                return "Selecciona un semestre";
                              }
                            },
                            
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.onetwothree_sharp, 
                                size: 30, 
                                color: Color.fromARGB(255, 5, 78, 186) ,
                              ),
                              labelText: "     Semestre", 
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              isDense: true,
                            ),
                            

                          ),
                        ),
                      ),

                      const SizedBox(width: 80,), // Espacio entre los campos


                      // Expanded(
                      //   child: Container(
                         
                      //   ),
                      // ),


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
                            horizontal: 15,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {

                                RegExp telefonoPrincipal =  RegExp(r'^[0-9]{10}$');
                                RegExp letraTelefono = RegExp(r'^[a-zA-Z\s]+$');

                                if (letraTelefono.hasMatch(value)) {
                                   return "Solo numeros";

                                 } else {
                                    if (!telefonoPrincipal.hasMatch(value)) {
                                  
                                     return "10 digitos";
                                   }
                                 }
                                
                              } else {
                                // // Otras condiciones de validación
                                // if (value == null) {
                                //   return "El valor no cumple con los requisitos";
                                // }
                                return null;
                              }

                              return null;
                            },
                            controller: telefonoOpcional,
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
                            horizontal: 80, vertical: 40
                          ),
        
                         child: 
          
                         OutlinedButton.icon(
                            onPressed: () {
                              if (_keyForm.currentState != null && _keyForm.currentState!.validate()) {
                                // int posicionGrupo = listaDeGrupo.indexOf(grupoSelected) + 1;
                                // print(posicionGrupo);

                                print("Valor seleccionado: $grupoSelected");
                                // int selectedGroupValue = listaDeGrupo.indexOf(grupoSelected) + 1;
                                print("Datos de formulario:");
                                print("grupoSelected: $grupoSelected");
                                // print("selectedGroupValue: $selectedGroupValue");
                              
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
                                      "Registrar Alumno",
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
                                  return const Color.fromARGB(255, 239, 68, 20);
                                  
                                }
                                return const Color.fromARGB(255, 48, 8, 206); // Por defecto, usa el overlayColor predeterminado
                              }),
                      
                               backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 17, 5, 130)),
                            ),
                          ),
                                
                         
                         ),
                      ),
                    ],
                  )
                  
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