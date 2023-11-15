// ignore_for_file: body_might_complete_normally_nullable, avoid_print, unnecessary_new, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../../widgets/Animatios/Animaciones.dart';
import 'package:http/http.dart' as http;

class UpdateFomrularioAlumno extends StatefulWidget {
  static const UpdateformularioAlumno = "Formulario-Alumno";

  final String idGrupo;
  final String idSemestre;

  const UpdateFomrularioAlumno(
      {super.key,
      required this.idGrupo,
      required this.idSemestre});
  @override
  State<UpdateFomrularioAlumno> createState() => _UpdateFomrularioAlumnoState();
}
class _UpdateFomrularioAlumnoState extends State<UpdateFomrularioAlumno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 5, 130),
        toolbarHeight: 80,
        title: const Text(
          "Actualizar Alumno",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: UpdateFormularioAlumnoTextfield(

        idGrupo: widget.idGrupo,
        idSemestre: widget.idSemestre,
      ),
    );
  }
}
// ignore: must_be_immutable
class UpdateFormularioAlumnoTextfield extends StatefulWidget {

  final String idGrupo;
  final String idSemestre;
  UpdateFormularioAlumnoTextfield(
      {super.key,
      required this.idGrupo,
      required this.idSemestre});

  @override
  State<UpdateFormularioAlumnoTextfield> createState() =>
      _UpdateFormularioAlumnoTextfieldState();
}

class _UpdateFormularioAlumnoTextfieldState extends State<UpdateFormularioAlumnoTextfield> {
  List<String> listaDeGrupo = [ "A","B",];
  List<String> listaDeSemestre = ["Primero","Segundo","Tercer","Cuarto","Quinto","Sexto"
  ];
  TextEditingController matricula = TextEditingController();
  TextEditingController nia = TextEditingController();
  TextEditingController nombre = TextEditingController();

  final _keyForm = GlobalKey<FormState>();
  int posicionGrupo = 0;
  late String grupoSeleccion;
  
  int posicionSemestre = 0;
  late String semestreSeleccion;

  @override
  void initState() {
    super.initState();

    // grupoSeleccion = listaDeGrupo[0];
    // semestreSeleccion = listaDeSemestre[0];
    grupoSeleccion = widget.idGrupo;
    semestreSeleccion = widget.idSemestre;
    setState(() {
      
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // String grupoSelected = listaDeGrupo[0];

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
                      const SizedBox(width: 10), // Espacio entre los campos
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: DropdownButtonFormField(
                            items: listaDeGrupo.map((grupos) {
                              return DropdownMenuItem(
                                value: grupos,
                                child: Text(grupos),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                grupoSeleccion = value!;
                                // print("grupoSelected actualizado: $grupoSelected");
                                // grupoSelected = listaDeSemestre.indexOf(value!);
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Selecciona un Grupo";
                              }
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.abc_sharp,
                                size: 30,
                                color: Color.fromARGB(255, 5, 78, 186),
                              ),
                              labelText: "     Grupo",
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              isDense: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(
                        width: 80,
                      ), // Espacio entre los campos

                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: DropdownButtonFormField(
                            items: listaDeSemestre.map((name) {
                              return DropdownMenuItem(
                                value: name,
                                child: Text(name),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                semestreSeleccion = value!;
                              });
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
                                color: Color.fromARGB(255, 5, 78, 186),
                              ),
                              labelText: "     Semestre",
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 6, 30, 65),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              isDense: true,
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
                              horizontal: 80, vertical: 40),
                          child: OutlinedButton.icon(
                            onPressed: () async {
                               
                                if (_keyForm.currentState != null && _keyForm.currentState!.validate()) {
                                  posicionGrupo =
                                      listaDeGrupo.indexOf(grupoSeleccion) + 1;
                                  posicionSemestre = listaDeSemestre
                                          .indexOf(semestreSeleccion) +
                                      1;

                                  var url = Uri.parse('https://pruebas97979797.000webhostapp.com/apis/admin/alumno/insertAlumno.php');
                                  var response = await http.post(
                                    url, 
                                    body: {
                                      
                                      'grupo': posicionGrupo.toString(),
                                      'semestre': posicionSemestre.toString(),
                                    }
                                  );
                                print("200");

                              } else {

                                print("ERROR");
                              }
                            },
                            icon: FadeAnimation(
                                1,
                                const Icon(
                                  Icons.person_add,
                                  color: Colors.white,
                                )),
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
                                          color: Colors.white),
                                    )),
                              ],
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

/*
 OutlinedButton.icon(
                            onPressed: () {
                              if (_keyForm.currentState != null && _keyForm.currentState!.validate()) {
                                // int posicionGrupo = listaDeGrupo.indexOf(grupoSelected) + 1;
                                // print(posicionGrupo);

                                // print("Valor seleccionado BUTTON: $grupoSelected");
                                // int selectedGroupValue = listaDeGrupo.indexOf(grupoSeleccion) + 1;
                                // print("Datos de formulario:");
                                // print("grupoSelected: $grupoSeleccion");
                                // print("selectedGroupValue: $selectedGroupValue");
                                posicionGrupo = listaDeGrupo.indexOf(grupoSeleccion) + 1;

                                print("Valor GRUPO seleccionado: $grupoSeleccion");
                                print("Valor entero para GRUPO ==>: $posicionGrupo");

                                posicionSemestre = listaDeSemestre.indexOf(semestreSeleccion) + 1;
                                print("Valor SEMESTRE seleccionado: $semestreSeleccion");
                                print("Valor entero para SEMESTRE ==>: $posicionSemestre");
                                                

                                print("Validacion Exitosa");
                                setState(() {
                                  grupoSeleccion = listaDeGrupo[0];
                                  semestreSeleccion = listaDeGrupo[0];
                                });
                                
                              } else{

                                print("Validacion no Exitosa");
                              }
                            },
*/

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
