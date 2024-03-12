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
  DateTime selectedDate = DateTime.now();
  Map<String, int> selectedOptions = {};
  bool selectAll = false;



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

 

void _updateAllSelection() {
  setState(() {
    selectAll = !selectAll;
    for (var alumno in data) {
      selectedOptions[alumno.id] = selectAll ? 1 : 0;
    }
  });
}


  bool todosSeleccionados() {
    // Verificar si todos los radio buttons están seleccionados
    for (int i = 0; i < data.length; i++) {
      if (selectedOptions[data[i].id] == null ||
          selectedOptions[data[i].id] == 0) {
        return false;
      }
    }
    return true;
  }

  void mostrarMensaje() {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content:  Text('Por favor, selecciona todas las opciones antes de enviar.'),
      duration:  Duration(seconds: 2),
    ),
  );
}
  // bool todosSeleccionados() {
  //   return selectedOptions.values.every((value) => value != null);
  // }


// void imprimirValoresSeleccionados() {
//     for (String idAlumno in selectedOptions.keys) {
//       int? valorSeleccionado = selectedOptions[idAlumno];
//       print('ID Alumno: $idAlumno - Valor Seleccionado: $valorSeleccionado');
//     }
//   }

  void enviarDatos() {
    // Aquí deberías enviar la solicitud POST con los datos seleccionados.
    // Puedes usar el paquete http para hacer la solicitud.
    // Por ejemplo, si tienes una función que envía la solicitud:
    // enviarSolicitudPost(selectedOptions);
    print('Enviando datos...');
    print(selectedOptions);
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
          "Alumnos ${widget.idMateriaNavBar}",
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () async{
              final DateTime? dateTime = await showDatePicker(
                context: context, 
                initialDate: selectedDate,
                firstDate: DateTime(2000), 
                lastDate: DateTime(3000),
                // locale: const Locale('es'),

              );
              if (dateTime != null) {
                setState(() {
                  selectedDate = dateTime;
                });

              }
            },
            icon: const Icon(
              Icons.calendar_month,
              color: Colors.white,
              size: 30,
            ),
            // style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          ),

          IconButton(
            onPressed: () {
              _updateAllSelection();
            },
            icon: Icon(
              selectAll ? Icons.check_circle : Icons.radio_button_off,
              color: Colors.white,
              size: 30,
            ),
          ),

          const SizedBox(
            width: 15,
          ),
          
          // IconButton(
          //   onPressed: () {
          //     imprimirValoresSeleccionados();
          //   },
          //   icon: const Icon(
          //     Icons.print,
          //     color: Colors.white,
          //   ),
          // ),

        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded, 
            color:
                Colors.white, 
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
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
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
                      TextSpan(
                        text:
                            '${data[index].nombre} ${data[index].appaterno} \n${data[index].apmaterno}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(17, 5, 130, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                
                trailing: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: selectedOptions[data[index].id],
                      onChanged: (value) {
                        setState(() {
                          selectedOptions[data[index].id] = 1;
                        });
                      },
                    ),
                    const Text('A'),
                    Radio(
                      value: 2,
                      groupValue: selectedOptions[data[index].id],
                      onChanged: (value) {
                        setState(() {
                          selectedOptions[data[index].id] = 2;
                        });
                      },
                    ),
                    const Text('F'),
                    Radio(
                      value: 3,
                      groupValue: selectedOptions[data[index].id],
                      onChanged: (value) {
                        setState(() {
                          selectedOptions[data[index].id] = 3;
                        });
                      },
                    ),
                    const Text('P'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: todosSeleccionados() ? enviarDatos : mostrarMensaje,
          
        label: const Text('Enviar'),
        icon: const Icon(Icons.send),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

