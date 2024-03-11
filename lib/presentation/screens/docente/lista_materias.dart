import 'dart:convert';

import 'package:app_ciyed/presentation/screens/admin/semestres/primero/semestres_lista_a.dart';
import 'package:app_ciyed/presentation/screens/docente/jsonmaterias/getListaMateriasJson.dart';
import 'package:app_ciyed/presentation/screens/docente/nabvar_alumnos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ListaMaterias extends StatefulWidget {
  final int numeroSemestre;
  final String id;
  const ListaMaterias({
    super.key, 
    required this.numeroSemestre,
    required this.id
  });

  @override
  State<ListaMaterias> createState() => _ListaMateriasState();
}

class _ListaMateriasState extends State<ListaMaterias> {

  List<MateriasDocente> data = <MateriasDocente>[];
  late bool _isDisposed;


  Future<List<MateriasDocente>> getMaterias() async{
    var response = await http.get(Uri.parse('https://pruebas97979797.000webhostapp.com/apis/docente/Materias/getMaterias.php'));
    var jsonData = jsonDecode(response.body);
    var registros = <MateriasDocente>[];

    if (jsonData is List) {
      for (var datos in jsonData) {
        // registros.add(MateriasDocente.fromJson(datos));
        var materia = MateriasDocente.fromJson(datos);
        if (materia.idSemestre == widget.numeroSemestre.toString() && materia.idUsuario == widget.id.toString()) {
          registros.add(materia);
        }
      }
    } else {
      registros.add(MateriasDocente.fromJson(jsonData));
    }
    return registros;
  }
    Future<void> startLongPolling() async {
      while (!_isDisposed) {
      await Future.delayed(const Duration(seconds: 1)); // Espera 10 segundos
      if (!_isDisposed) {
          var newData = await getMaterias();
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
    // print("${widget.id}");
    // print("${widget.numeroSemestre}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 5, 130),
        toolbarHeight: 80,
        title:  Text(
          "Materias ${widget.numeroSemestre} semestre",
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
                      builder: (context) =>
                          // const ListSemestreGrupoA(numeroSemestre: 1)
                          NavBarAlumnosMateria(idDocente: data[index].idUsuario, idMateria: data[index].id, numeroSemestre: widget.numeroSemestre)

                  )
                );
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
                              '${data[index].nombre} ',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
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