/*import 'package:flutter/material.dart';

class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 5, 130),
        toolbarHeight: 80,
        title:  const Text(
          "Alumnos semestre",
          style: TextStyle(color: Colors.white),
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
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        )),
      ),

      body: Text(
        'Fecha seleccionada: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
        style: const TextStyle(color: Color.fromARGB(255, 29, 2, 2)),
      ),

    );
  }

}*/

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


  Future<List<AsistenciaAlumnos>> getDatos() async {
    var response = await http.get(Uri.parse('httente/alumntencia.php'));
    var jsonData = jsonDecode(response.body);
    var registros = <AsistenciaAlumnos>[];
    
    if (jsonData is List) {
      for (var datos in jsonData) {
        registros.add(AsistenciaAlumnos.fromJson(datos));

      }
    } else {
      registros.add(AsistenciaAlumnos.fromJson(jsonData));
    }
    return registros;
  }

  Future<void> startLongPolling() async {
    
    await Future.delayed(const Duration(seconds: 1)); // Espera 10 segundos
    if (!_isDisposed) {
        var newData = await getDatos();
        setState(() {
          data.clear();
          data.addAll(newData);
        });
      }  
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
            onPressed: () async{

            },
            icon: const Icon(
              Icons.calendar_month,
              color: Colors.white,
              size: 30,
            ),
            // style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
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
                
                trailing: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: null,
                      onChanged: null,
                    ),
                    Text('A'),
                    Radio(
                      value: 2,
                      groupValue: null,
                      onChanged: null,
                      
                    ),
                    Text('F'),
                    Radio(
                      value: 3,
                      groupValue: null,
                      onChanged: null,
                    ),
                    Text('P'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}