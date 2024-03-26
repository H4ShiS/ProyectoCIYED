// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:convert';

import 'package:app_ciyed/presentation/screens/admin/formulariosMaterias/getListaMateriasFromJSON.dart';
import 'package:app_ciyed/presentation/screens/admin/formulariosMaterias/updateMaterias.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//lista de las materias para que se visualicen en una pantalla

class GetListaMaterias extends StatefulWidget {
  static const opcionesMateria = "opciones materia";
  const GetListaMaterias({super.key});

  @override
  State<GetListaMaterias> createState() => _GetListaMateriasState();
}

class _GetListaMateriasState extends State<GetListaMaterias> {

  List<GetMateriaLista> data = <GetMateriaLista>[];
  late bool _isDisposed;


  Future<List<GetMateriaLista>> getMaterias() async {
    var response = await http.get(Uri.parse('https://pruebas97979797.000webhostapp.com/apis/admin/materia/getMateria.php'));
    var jsonData = jsonDecode(response.body);
    var registros = <GetMateriaLista>[];

    if (jsonData is List) {
      for (var datos in jsonData) {
        registros.add(GetMateriaLista.fromJson(datos));
      }
    } else {
      registros.add(GetMateriaLista.fromJson(jsonData));
    }
    return registros;
  }

  Future<void> starPolling() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
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
    starPolling();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 5, 130),
        toolbarHeight: 80,
        title: const Text(
          "Materias",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 30,
            ),
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
                  builder: (context) => UpdateFomrularioMaterias(
                    materiaId: data[index].id,
                    nombreM: data[index].nombre,
                    matriculaM: data[index].matricula,
                    idSemestre: data[index].idSemestre,
                    idUsuario: data[index].idUsuario,
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

                            Navigator.of(context).pop(true);

                            String idAlumno = data[index].id;

                            print('Response data: ${idAlumno}');

                            var response = await http.get(Uri.parse('https://pruebas97979797.000webhostapp.com/apis/admin/eliminacion/deleteMateria.php?id=$idAlumno'),);

                            if (response.statusCode == 200) {
                              Map<String, dynamic> responseCode = json.decode(response.body);
                              int httpCode = responseCode['httpCode'];
                              String message = responseCode['message'];

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("$message, $httpCode")));
                              print('Response data: ${response.body}');
                            } else if (response.statusCode == 500) {
                              Map<String, dynamic> responseCode = json.decode(response.body);
                              int httpCode = responseCode['httpCode'];
                              String message = responseCode['message'];
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$message, $httpCode")));
                            } else {
                              Map<String, dynamic> responseCode = json.decode(response.body);
                              int httpCode = responseCode['httpCode'];
                              String message = responseCode['message'];
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("$message, $httpCode"))
                              );
                            }
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
                            text: ' ${data[index].nombre}',
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
    );
  }
}

/*child: Card(
                elevation: 2,
                margin:  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text('Matricula: ${data[index].matricula}', style: const TextStyle(fontSize: 18,),),
                  subtitle: Text(
                        'Nombre: ${data[index].nombre}',
                        style: const TextStyle(fontSize: 18),
                  ),
                  trailing: const Icon(Icons.arrow_back_ios_new_outlined),
                    
                )
              ) */