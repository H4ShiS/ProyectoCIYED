// ignore_for_file: file_names

import 'dart:convert';
import 'package:app_ciyed/presentation/screens/admin/formulariosDocentes/getDocentesFromJson.dart';
import 'package:app_ciyed/presentation/screens/admin/formulariosDocentes/updateDocente.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//esta es la lista de los docentes para que se visualicen en una pantalla

class OpcionesDocente extends StatefulWidget {
  static const opcionesDocente = "Opciones-Docente ";

  const OpcionesDocente({super.key});

  @override
  State<OpcionesDocente> createState() => _OpcionesDocenteState();
}

class _OpcionesDocenteState extends State<OpcionesDocente> {

  List<GetDocentes> data = <GetDocentes>[];
  late bool _isDisposed;

  Future<List<GetDocentes>> getDocentes() async {
    var response = await http.get(Uri.parse('https://pruebas97979797.000webhostapp.com/apis/admin/docente/getDocentes.php'));
    var jsonData = jsonDecode(response.body);
    var registros = <GetDocentes>[];

    if (jsonData is List) {
      for (var datos in jsonData) {
        registros.add(GetDocentes.fromJson(datos));
      }  
    } else {
      registros.add(GetDocentes.fromJson(jsonData));
    }
    return registros;
  }


//  Future<void> starPolling  () async{
  //   await Future.delayed(const Duration(seconds: 2));
  //   if (!_isDisposed) {
  //       var newData = await getDocentes();
  //       setState(() {
  //         data.clear();
  //         data.addAll(newData);
  //       });
  //     }
    
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _isDisposed = false;
  //   starPolling();
  // }


  Future<void> starPolling  () async{
    while (!_isDisposed) {
    await Future.delayed(const Duration(seconds: 2));
    if (!_isDisposed) {
        var newData = await getDocentes();
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
          "Lista Docente",
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
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => UpdateDocente(
                id: data[index].id,
                matricula: data[index].matricula,
                nombre: data[index].nombre,
                appaterno: data[index].appaterno,
                apmaterno: data[index].apmaterno,
                email: data[index].email,
                contrasena: data[index].contrasena,
                recordatorio: data[index].recordatorio,
              )
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
                    content: const Text("¿Estás seguro de que quieres eliminar este usuario?"),
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
                        blurRadius: 9
                      ),
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
                            text:
                                data[index].matricula,
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
                                '  ${data[index].nombre} ${data[index].appaterno} ${data[index].apmaterno}',
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






                           // Confirmar eliminar

                          //  String id = data[index].id;

                          //   try {
                          //     var response = await http.delete(
                          //       Uri.parse(
                          //           'https://pruebas97979797.000webhostapp.com/apis/admin/docente/deleteDocente.php/$id'),
                          //     );

                          //     if (response.statusCode == 200) {
                          //       Map<String, dynamic> responseData =
                          //           jsonDecode(response.body);
                          //       int httpCode = responseData['httpCode'];
                          //       String message = responseData['message'];

                          //       // ignore: use_build_context_synchronously
                          //       ScaffoldMessenger.of(context).showSnackBar(
                          //         SnackBar(content: Text(message)),
                          //       );

                          //       // Si deseas realizar alguna acción adicional después de eliminar, puedes hacerlo aquí.
                          //     } else {
                          //       print(
                          //           'Error al eliminar el usuario. Código de estado: ${response.statusCode}');
                          //       print(
                          //           'Respuesta del servidor: ${response.body}');
                          //     }
                          //   } catch (e) {
                          //     print('Error durante la solicitud DELETE: $e');
                          //   }







/*String id = data[index].id;
                          print(id);
                          
                          try {
                            
                                          
                          var response = await http.delete(Uri.parse('https://pruebas97979797.000webhostapp.com/apis/admin/docente/deleteDocente.php?id=$id'),).timeout(const Duration(seconds: 30));
                          
                          if (response.statusCode == 200) {
                            Map<String, dynamic> responseData = jsonDecode(response.body);
                            int httpCode = responseData['httpCode'];
                            String message = responseData['message'];
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(message))
                            );

                            print('Response data: ${response.body}');
                            
                          } else {
                            print('Response data: ${response.body}');

                          }

                          } catch (e) {
                            print('Error durante la solicitud DELETE: $e');
                            if (e is http.ClientException) {
                              print('Detalles del error: ${e.message}');
                            }
                          }  */