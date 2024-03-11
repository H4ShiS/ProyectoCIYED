import 'dart:convert';

import 'package:app_ciyed/presentation/screens/docente/ListaDeGruposAlumnos/aistenciaJson.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AsistenciaGrupoA extends StatefulWidget {
  final String idDocenteNavBar;
  final String idMateriaNavBar;
  final int numeroSemestreNavBar;
  const AsistenciaGrupoA({
    super.key, 
    required this.idDocenteNavBar, 
    required this.idMateriaNavBar, 
    required this.numeroSemestreNavBar,
  });

  @override
  State<AsistenciaGrupoA> createState() => _AsistenciaGrupoAState();
}

class _AsistenciaGrupoAState extends State<AsistenciaGrupoA> {
  List<AsistenciaAlumnos> data = <AsistenciaAlumnos>[];
  late bool _isDisposed;

  Future<List<AsistenciaAlumnos>> getDatos() async {
    var response = await http.get(Uri.parse('https://pruebas97979797.000webhostapp.com/apis/docente/alumnos/alumnosAsistencia.php'));
    var jsonData = jsonDecode(response.body);
    var registros = <AsistenciaAlumnos>[];
    
    if (jsonData is List) {
      for (var datos in jsonData) {
        // registros.add(GetAlumnosPrimero.fromJson(datos));
        var alumno = AsistenciaAlumnos.fromJson(datos);
        if (alumno.idSemestre == widget.numeroSemestreNavBar.toString() && alumno.idGrupo == "1") {
          registros.add(alumno);
        }
      }
    } else {
      registros.add(AsistenciaAlumnos.fromJson(jsonData));
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
          "Alumnos ${widget.idMateriaNavBar} semestre",
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
          return Card(
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
                        text: 'Alumno: ',
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
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}