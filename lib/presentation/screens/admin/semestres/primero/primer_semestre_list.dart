// ignore_for_file: unused_field, camel_case_types

import 'dart:convert';
import 'package:app_ciyed/presentation/screens/admin/semestres/primero/getListaPrimeroJson.dart';
import 'package:app_ciyed/presentation/screens/admin/semestres/primero/update_formulario_alumno.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListPrimero extends StatefulWidget {

  static const listaPrimero = "Primer Semestre";
  const ListPrimero({super.key});

  @override
  State<ListPrimero> createState() => _ListPrimeroState();
}

class _ListPrimeroState extends State<ListPrimero> {

  List<GetAlumnosPrimero> data = <GetAlumnosPrimero>[];
  late bool _isDisposed;

  
  Future<List<GetAlumnosPrimero>> getDatos() async {
    var response = await http.get(Uri.parse('https://pruebas97979797.000webhostapp.com/apis/admin/alumno/primero/getPrimerSemestre.php'));
    var jsonData = jsonDecode(response.body);

    var registros = <GetAlumnosPrimero>[];
    
    if (jsonData is List) {
      for (var datos in jsonData) {
        registros.add(GetAlumnosPrimero.fromJson(datos));
      }
    } else {
      registros.add(GetAlumnosPrimero.fromJson(jsonData));
    }

    return registros;
  }

  Future<void> startLongPolling() async {
     
      await Future.delayed(const Duration(seconds: 5)); // Espera 10 segundos

      if (!_isDisposed) {
        var newData = await getDatos();
        setState(() {
          data.clear();
          data.addAll(newData);
        });
      }
    
  }

  @override
  void initState() {
    super.initState();
    _isDisposed = false;
    startLongPolling();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 5, 130),
        toolbarHeight: 80,
        title: const Text(
          "Lista Alumno",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
            child: Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(data[index].nombre, style: const TextStyle(fontSize: 16)),
                trailing: const Icon(Icons.arrow_back_ios_new_outlined), // Personaliza el icono según tus necesidades
              ),
            ),
          );
        },
      ),
    );
  }
}

