// ignore_for_file: body_might_complete_normally_nullable, avoid_print, unnecessary_new, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../widgets/Animatios/Animaciones.dart';
import 'package:http/http.dart' as http;

class FomrularioAlumno extends StatefulWidget {
  static const formularioAlumno = "Formulario-Alumno";
  const FomrularioAlumno({super.key});

  @override
  State<FomrularioAlumno> createState() => _FomrularioAlumnoState();
}

class _FomrularioAlumnoState extends State<FomrularioAlumno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 5, 130),
        toolbarHeight: 80,
        title: const Text(
          "Registrar Alumno",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.format_list_bulleted_add,
              color: Colors.white,
              size: 30,
            ),
            // style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          ),
          const SizedBox(
            width: 15,
          ),
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
        )),
      ),
      body: FormularioAlumnoTextfield(),
    );
  }
}

// ignore: must_be_immutable
class FormularioAlumnoTextfield extends StatefulWidget {
  FormularioAlumnoTextfield({super.key});

  @override
  State<FormularioAlumnoTextfield> createState() =>
      _FormularioAlumnoTextfieldState();
}

class _FormularioAlumnoTextfieldState extends State<FormularioAlumnoTextfield> {
  List<String> listaDeGrupo = [
    "A",
    "B",
  ];
  List<String> listaDeSemestre = [
    "Primero",
    "Segundo",
    "Tercer",
    "Cuarto",
    "Quinto",
    "Sexto"
  ];
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
  int posicionGrupo = 0;
  late String grupoSeleccion;
  int posicionSemestre = 0;
  late String semestreSeleccion;

  @override
  void initState() {
    super.initState();

    grupoSeleccion = listaDeGrupo[0];
    semestreSeleccion = listaDeSemestre[0];
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
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 30),
                          child: TextFormField(
                            validator: (valor) {
                              if (valor != null && valor.isNotEmpty) {
                                RegExp matriculaExpress =
                                    RegExp(r'^[A-Z0-9]+$');
                                RegExp matriculaContador =
                                    RegExp(r'^[A-Z0-9]{10,12}$');

                                if (!matriculaExpress.hasMatch(valor)) {
                                  return "Letras Mayusculas, Numeros";
                                } else {
                                  if (!matriculaContador.hasMatch(valor)) {
                                    return "10 - 12";
                                  }
                                }
                              } else {
                                return "Ingresa la Matricula";
                              }
                              return null;
                            },
                            controller: matricula,
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
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                RegExp niaalumno = RegExp(r'^[0-9]{10,12}$');

                                if (!niaalumno.hasMatch(value)) {
                                  return "Solo numeros y 10 digitos";
                                }
                              } else {
                                return null;
                              }
                            },
                            controller: nia,
                            keyboardType: TextInputType.number,
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
                            horizontal: 15,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                RegExp nombreAlumno = RegExp(r'^[a-zA-Z\s]+$');

                                if (!nombreAlumno.hasMatch(value)) {
                                  return "Solo letras";
                                }
                              } else {
                                return "Ingresa el Nombre";
                              }

                              return null;
                            },
                            controller: nombre,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label:
                                  FadeAnimation(1, const Text("Nombre Alumno")),
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
                          margin: const EdgeInsets.only(right: 15),
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                RegExp nombreAlumno = RegExp(r'^[a-zA-Z\s]+$');

                                if (!nombreAlumno.hasMatch(value)) {
                                  return "Solo letras";
                                }
                              } else {
                                return "Ingresa el dato";
                              }

                              return null;
                            },
                            controller: appaterno,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label:
                                  FadeAnimation(1, const Text("Ape. Paterno")),
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
                              horizontal: 15, vertical: 30),
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                RegExp apellidoMaterno =
                                    RegExp(r'^[a-zA-Z\s]+$');

                                if (!apellidoMaterno.hasMatch(value)) {
                                  return "Solo letras";
                                }
                              } else {
                                return "Ingresa el dato";
                              }
                            },
                            controller: apmaterno,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label:
                                  FadeAnimation(1, const Text("Ape. Materno")),
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

                      const SizedBox(
                        width: 80,
                      ), // Espacio entre los campos

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
                                RegExp nombreTutor = RegExp(r'^[a-zA-Z\s]+$');

                                if (!nombreTutor.hasMatch(value)) {
                                  return "Solo letras";
                                }
                              } else {
                                return "Ingresa el Nombre";
                              }

                              return null;
                            },
                            controller: nombreTutor,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label:
                                  FadeAnimation(1, const Text("Nombre Tutor")),
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
                          margin: const EdgeInsets.only(right: 15),
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                RegExp apPTutor = new RegExp(r'^[a-zA-Z\s]+$');

                                if (!apPTutor.hasMatch(value)) {
                                  return "Solo letras";
                                }
                              } else {
                                return "Ingresa el dato";
                              }
                            },
                            controller: appaternoTutor,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label:
                                  FadeAnimation(1, const Text("Ape. Paterno")),
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
                              horizontal: 15, vertical: 30),
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                RegExp apMTutor = new RegExp(r'^[a-zA-Z\s]+$');

                                if (!apMTutor.hasMatch(value)) {
                                  return "Solo letrras";
                                }
                              } else {
                                return "Ingresa el dato";
                              }
                            },
                            controller: apmatertoTutor,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label:
                                  FadeAnimation(1, const Text("Ape. Materno")),
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
                          margin: const EdgeInsets.only(right: 15),
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                RegExp telefonoPrincipal =
                                    RegExp(r'^[0-9]{10}$');
                                RegExp letraTelefono = RegExp(r'^[a-zA-Z\s]+$');

                                if (letraTelefono.hasMatch(value)) {
                                  return "Solo numeros";
                                } else {
                                  if (!telefonoPrincipal.hasMatch(value)) {
                                    return "10 digitos";
                                  }
                                }
                              } else {
                                return "Ingresa el Telefono";
                              }
                            },
                            controller: telefono,
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
                            horizontal: 15,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                RegExp telefonoPrincipal =
                                    RegExp(r'^[0-9]{10}$');
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
                              label: FadeAnimation(
                                  1, const Text("Telefono Opcional")),
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
                        child: Container(),
                      ),
                    ],
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
                                      'nombre': nombre.text,
                                      'apePaterno': appaterno.text,
                                      'apeMaterno': apmaterno.text,
                                      'nombretutor': nombreTutor.text,
                                      'appaternotutor': appaternoTutor.text,
                                      'apmaternotutor': apmatertoTutor.text,
                                      'telefono': telefono.text,
                                      'telopcional': telefonoOpcional.text,
                                      'nia': nia.text,
                                      'matricula': matricula.text,
                                      'grupo': posicionGrupo.toString(),
                                      'semestre': posicionSemestre.toString(),
                                    }
                                  );
                                  if (response.statusCode == 200) {
                                    Map<String, dynamic> responseData = json.decode(response.body);
                                    int httpCode = responseData['httpCode'];
                                    String message = responseData['message'];

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(message))
                                    );

                                    nombre.clear();
                                    appaterno.clear();
                                    apmaterno.clear();
                                    nombreTutor.clear();
                                    appaternoTutor.clear();
                                    apmatertoTutor.clear();
                                    telefono.clear();
                                    telefonoOpcional.clear();
                                    nia.clear();
                                    matricula.clear();
                                    print("Validacion Exitosa");
                                    setState(() {
                                      grupoSeleccion = listaDeGrupo[0];
                                      semestreSeleccion = listaDeGrupo[0];
                                    });

                                  print('Response data-------------------------: ${response.body}');
                                  
                                  } else if(response.statusCode == 409){
                                    Map<String, dynamic> responseData = json.decode(response.body);
                                    int httpCode = responseData['httpCode'];
                                    String message = responseData['message'];

                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(message,
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  ));
                                  
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Error en la solicitud. Código de estado: ${response.statusCode}', 
                                        style: const TextStyle(color: Colors.red),)
                                      )
                                    );

                                  }
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
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  const Size(270, 52)),
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return const Color.fromARGB(255, 239, 68, 20);
                                }
                                return const Color.fromARGB(255, 48, 8,
                                    206); // Por defecto, usa el overlayColor predeterminado
                              }),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 17, 5, 130)),
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
