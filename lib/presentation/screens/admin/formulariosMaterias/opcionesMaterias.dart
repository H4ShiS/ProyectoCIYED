// ignore_for_file: file_names

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
    while (!_isDisposed) {
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
        )
      ),
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
              child: Card(
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
              ),
            ),
          );
          
        },
      ),
    );
  }
}

