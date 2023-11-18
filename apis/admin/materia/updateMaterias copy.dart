// ignore_for_file: avoid_print, avoid_unnecessary_containers, use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../lib/presentation/widgets/Animatios/Animaciones.dart';
import 'package:http/http.dart' as http;


class UpdateFomrularioMaterias  extends StatelessWidget {
  static const updateFormularioMaterias = "update-formulario-materias";

  final String materiaId;
  final String nombre;

  final String idUsuario;
  final String idSemestre;

  const UpdateFomrularioMaterias(
      {super.key,
      required this.materiaId,
      required this.nombre,
      required this.idUsuario,
      required this.idSemestre});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 17, 5, 130),
          toolbarHeight: 80,
        title: const  Text(
          "Registrar Materia", 
          style: TextStyle(color: Colors.white),
        ),

      ),

      body: UpdateFormularioMateriasTextfield(
        userId: materiaId,
        nombre: nombre,
        idUsuario: idUsuario,
        idSemestre: idSemestre,
      ),

    );
  }
}

// ignore: must_be_immutable
class UpdateFormularioMateriasTextfield extends StatefulWidget {
  final String userId;
  final String nombre;
  final String idUsuario;
  final String idSemestre;

  UpdateFormularioMateriasTextfield(
      {super.key,
      required this.userId,
      required this.nombre,
      required this.idUsuario,
      required this.idSemestre});

  @override
  State<UpdateFormularioMateriasTextfield> createState() => _UpdateFormularioMateriasTextfieldState();
}

class _UpdateFormularioMateriasTextfieldState extends State<UpdateFormularioMateriasTextfield> {
  
  final _keyForm = GlobalKey<FormState>();
  TextEditingController updateMatriculaMateria = TextEditingController();
  TextEditingController updateNombreMateria = TextEditingController();
  List<String> listaDeSemestre = [ "Primero",  "Segundo", "Tercer", "Cuarto","Quinto", "Sexto"];
  late List<Map<String, dynamic>> docentes;
  Map<String, dynamic> docenteSelected = {};
  int posicionSemestre = 0;
  late String semestreSeleccion; 


  @override
  void initState() {
    super.initState();
    // semestreSeleccion = listaDeSemestre[0];
    docentes = [];
    semestreSeleccion = semestreSeleccion = listaDeSemestre[int.parse(widget.idSemestre) - 1];
    // docenteSelected = {};
    fetchData();
  }
    Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://pruebas97979797.000webhostapp.com/apis/admin/materia/getNombreDocente.php'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        docentes = data.map((item) => {
          'idDocente': item['id'],
          'nombre': item['nombre'].toString(),
          'appaterno': item['appaterno'].toString(),
          'apmaterno': item['apmaterno'].toString(),
        }).toList();
      });
    } else {
      throw Exception('Error al cargar datos');
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    updateNombreMateria.text = widget.nombre;
    return ListView(
  
      physics: const BouncingScrollPhysics(),
      children: [
        Expanded(
          child: Container(
            child: Form(        
              key: _keyForm,
              child: Column(
                children: [  
                  Row(                   
                    children: [
                      const SizedBox(width: 10), // Espacio entre los campos
                      Expanded(                        
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15,),
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                              } else {
                                return "Ingresa el Nombre";
                              }
                              return null;
                            },
                            controller: updateNombreMateria,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: FadeAnimation(1, const Text("Nombre de la Materia")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(
                                Icons. menu_book,
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
                    ],
                  ),      
                  Row(
                    children: [

                      // Espacio entre los campos
                      const SizedBox(width: 10), // Espacio entre los campos
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                          child: DropdownButtonFormField(
                            items: docentes.map((Map<String, dynamic> value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(
                                  '${value['nombre']} ${value['appaterno']} ${value['apmaterno']}',
                                ),
                              );
                            }).toList(),
                            onChanged: (Map<String, dynamic>? value) {
                              setState(() {
                                docenteSelected = value!;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {

                                return "Selecciona un Docente";
                              }
                            },

                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person_pin_rounded,
                                size: 30,
                                color: Color.fromARGB(255, 5, 78, 186),
                              ),
                              labelText: "     Docente",
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

                      const SizedBox(width: 80,), // Espacio entre los campos

                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15,),
                          child: DropdownButtonFormField(
                            value: semestreSeleccion,
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
                    ],                
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
        
                          margin: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 80
                          ),
        
                         child: 
          
                         OutlinedButton.icon(
                            onPressed: () async{
                              if (_keyForm.currentState != null && _keyForm.currentState!.validate()) {

                                String idDocenteSeleccionado  = docenteSelected['idDocente'].toString();
                                print("Valor GRUPO seleccionado: $docenteSelected");
                                print("Valor entero para la API: $idDocenteSeleccionado");

                                posicionSemestre = listaDeSemestre.indexOf(semestreSeleccion) + 1;
                                print("Valor SEMESTRE seleccionado: $semestreSeleccion");
                                print("Valor entero para SEMESTRE ==>: $posicionSemestre");
                                print("Validacion Exitosa");
                                
                              } else{

                                print("Validacion no Exitosa");
                              }
                            },
                            icon: FadeAnimation(1, const Icon(Icons.bookmark_add, color: Colors.white,)),
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 10),
                                FadeAnimation(
                                    1,
                                    const Text(
                                      "Registrar Materia",
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