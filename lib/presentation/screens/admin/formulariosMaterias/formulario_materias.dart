// ignore_for_file: avoid_print, avoid_unnecessary_containers, use_build_context_synchronously, body_might_complete_normally_nullable, unused_local_variable, prefer_const_constructors_in_immutables
import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../widgets/Animatios/Animaciones.dart';
import 'package:http/http.dart' as http;


class FomrularioMaterias  extends StatelessWidget {
  static const formularioMaterias = "formulario-materias";
  const FomrularioMaterias ({super.key});


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

        actions: [
            
            IconButton(
              onPressed: (){}, 
              icon: const Icon(
                Icons.book, 
                color: Colors.white, size: 30,
              ),
              // style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
            
            ),

            IconButton(
              onPressed: (){}, 
              icon: const Icon(
                Icons.article_rounded, 
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

      body: FormularioMateriasTextfield(),

    );
  }
}


// ignore: must_be_immutable
class FormularioMateriasTextfield extends StatefulWidget {
   FormularioMateriasTextfield({super.key});

  @override
  State<FormularioMateriasTextfield> createState() => _FormularioMateriasTextfieldState();
}

class _FormularioMateriasTextfieldState extends State<FormularioMateriasTextfield> {
  
  final _keyForm = GlobalKey<FormState>();
  TextEditingController matriculaMateria = TextEditingController();
  TextEditingController nombreMateria = TextEditingController();
  List<String> listaDeSemestre = [ "Primero",  "Segundo", "Tercer", "Cuarto","Quinto", "Sexto"];

  late List<Map<String, dynamic>> docentes;
  Map<String, dynamic> docenteSelected = {};
  int posicionSemestre = 0;
  late String semestreSeleccion; 
  int posicionDocente = 0;


  @override
  void initState() {
    super.initState();
    semestreSeleccion = listaDeSemestre[0];
    docentes = [];
    // docenteSelected = {};
    fetchData();

  }


    Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://pruebas97979797.000webhostapp.com/apis/admin/materia/getNombreDocente.php'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        docentes = data.map((item) => {
          'id': item['id'],
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
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Form(      
                key: _keyForm,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 80), // Espacio entre los campos
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                            child: TextFormField(
                              
                              validator: (valor) {
                                if (valor != null && valor.isNotEmpty) {
                      
                                  RegExp matriculaExpress =  RegExp(r'^[A-Z0-9]+$');
                                  RegExp matriculaContador =  RegExp(r'^[A-Z0-9]{10,12}$');
                      
                                  
                                  if (!matriculaExpress.hasMatch(valor)) {
                                    return "Letras Mayusculas y Numeros";
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
                              controller: matriculaMateria,
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
              
                        const SizedBox(width: 80), // Espacio entre los campos
                      
                      ],
                    ),
              
              
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
                              controller: nombreMateria,
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
                      
                                  String idDocenteSeleccionado  = docenteSelected['id'].toString();
                                  print("Valor GRUPO seleccionado: $docenteSelected");
                                  print("Valor entero para la API: $idDocenteSeleccionado");
                      
                                  posicionSemestre = listaDeSemestre.indexOf(semestreSeleccion) + 1;
                                  print("Valor SEMESTRE seleccionado: $semestreSeleccion");
                                  print("Valor entero para SEMESTRE ==>: $posicionSemestre");
                      
                                  var response = await http.post(Uri.parse('https://pruebas97979797.000webhostapp.com/apis/admin/materia/insertMateria.php'), 
                                    body: {
                                      'matricula': matriculaMateria.text,
                                      'nombremateria':  nombreMateria.text,
                                      'iddocente': idDocenteSeleccionado.toString(),
                                      'idsemestre': posicionSemestre.toString(),
                                    },
                                  );
                      
                      
                                  if (response.statusCode == 200) {
                                    Map<String, dynamic> responseData = json.decode(response.body);
                                    int httpCode = responseData['httpCode'];
                                    String message = responseData['message'];
                      
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(message))
                                    ); 
                      
                                    matriculaMateria.clear();
                                    nombreMateria.clear();
                      
                                  } else if(response.statusCode == 409){
                                    Map<String, dynamic> responseData = json.decode(response.body);
                                    int httpCode = responseData['httpCode'];
                                    String message = responseData['message'];
                      
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(message, 
                                        style: const TextStyle(color: Colors.red),)
                                      )
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Error en la solicitud. Código de estado: ${response.statusCode}', 
                                        style: const TextStyle(color: Colors.red),)
                                      )
                                    );
                      
                                  }
                                  
                                  
                      
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
            ],
          ),
        ),
      ),
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