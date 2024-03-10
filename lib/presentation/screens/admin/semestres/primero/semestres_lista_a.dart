// ignore_for_file: unused_field, camel_case_types, unrelated_type_equality_checks

import 'dart:convert';
import 'package:app_ciyed/presentation/screens/admin/semestres/primero/getListaPrimeroJson.dart';
import 'package:app_ciyed/presentation/screens/admin/semestres/primero/update_formulario_alumno.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListSemestreGrupoA extends StatefulWidget {

  static const listaPrimero = "Primer Semestre";
  final int numeroSemestre;
  const ListSemestreGrupoA({super.key, required this.numeroSemestre});

  @override
  State<ListSemestreGrupoA> createState() => _ListSemestreGrupoAState();
}

class _ListSemestreGrupoAState extends State<ListSemestreGrupoA> {

  int selectIndex = 0;
  List<GetAlumnosPrimero> data = <GetAlumnosPrimero>[];
  late bool _isDisposed;

  Future<List<GetAlumnosPrimero>> getDatos() async {
    var response = await http.get(Uri.parse('https://pruebas97979797.000webhostapp.com/apis/admin/alumno/primero/getPrimerSemestre.php'));
    var jsonData = jsonDecode(response.body);
    var registros = <GetAlumnosPrimero>[];
    
    if (jsonData is List) {
      for (var datos in jsonData) {
        // registros.add(GetAlumnosPrimero.fromJson(datos));
        var alumno = GetAlumnosPrimero.fromJson(datos);
        if (alumno.idSemestre == widget.numeroSemestre.toString() && alumno.idGrupo == "1") {
          registros.add(alumno);
        }
      }
    } else {
      registros.add(GetAlumnosPrimero.fromJson(jsonData));
    }
    return registros;
  }


  Future<void> startLongPolling() async {
    while (!_isDisposed) {
    await Future.delayed(const Duration(seconds: 1)); // Espera 10 segundos
    if (!_isDisposed) {
        var newData = await getDatos();
        setState(() {
          data.clear();
          data.addAll(newData);
        });
      }
    }   
  }

  @override
  void initState() {
    super.initState();
    _isDisposed = false;
    startLongPolling();
  }

  @override
  void dispose() {
    super.dispose();
    _isDisposed = true;
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 5, 130),
        toolbarHeight: 80,
        title:  Text(
          "Alumnos ${widget.numeroSemestre} semestre",
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: const Icon(
              Icons.list_alt_outlined,
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
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => UpdateFomrularioAlumno(
                    id: data[index].id,
                    nombre: data[index].nombre,
                    appaterno: data[index].appaterno,
                    apmaterno: data[index].apmaterno,
                    nombretutor: data[index].nombretutor,
                    apptutor: data[index].apptutor,
                    apmtutor: data[index].apmtutor,
                    telefono: data[index].telefono,
                    telefonoopcional: data[index].telefonoopcional,
                    matricula: data[index].matricula,
                    nia: data[index].nia,
                    idGrupo: data[index].idGrupo,
                    idSemestre: data[index].idSemestre,
                    
                  ),
                )
              );
            },
            child: Dismissible(
              key: Key(data[index].id),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              confirmDismiss: (direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirmación"),
                      content: const Text(
                          "¿Estás seguro de que quieres eliminar este usuario?"),
                      actions: [
                        TextButton(
                          child: const Text("Cancelar"),
                          onPressed: () {
                            Navigator.of(context).pop(false); // No eliminar
                          },
                        ),
                        TextButton(
                          child: const Text("Eliminar"),
                          onPressed: () async {
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              onDismissed: (direction) {
                setState(() {
                  data.removeAt(index);
                });
              },
              child: Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 5),
                          color: Colors.black.withOpacity(.111),
                          blurRadius: 9),
                    ],
                  ),
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Matricula: ',
                            style: TextStyle(
                              fontSize: 17,
                              color: Color.fromRGBO(17, 5, 130, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: data[index].matricula,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Nombre: ',
                            style: TextStyle(
                              fontSize: 17,
                              color: Color.fromRGBO(17, 5, 130, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                '${data[index].nombre} ${data[index].appaterno} ${data[index].apmaterno}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Color.fromARGB(255, 17, 5, 130),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectIndex,
        onTap: (value) {
          
          setState(() {
            selectIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.two_wheeler),
            activeIcon: Icon(Icons.motorcycle),
            label: "Prueba",
            backgroundColor: Color.fromARGB(255, 17, 5, 130),
          ),


          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            activeIcon: Icon(Icons.people),
            label: "Personas",
            backgroundColor: Color.fromARGB(255, 17, 5, 130),
          ),

          
        ]
      ),*/
    );
  }
}


/*title: Text('Matricula: ${data[index].matricula}', style: const TextStyle(fontSize: 18,),),
                subtitle: Text(
                      'Nombre: ${data[index].nombre}',
                      style: const TextStyle(fontSize: 18),
                ), */


/*hild: Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(data[index].matricula, style: const TextStyle(fontSize: 18)),
                  subtitle: Text(
                        'Nombre: ${data[index].nombre} ${data[index].appaterno} ${data[index].apmaterno}', style: const TextStyle(fontSize: 18),
                  ),
                  trailing: const Icon(Icons.arrow_back_ios_new_outlined), // Personaliza el icono según tus necesidades
                ),
              ),
 */