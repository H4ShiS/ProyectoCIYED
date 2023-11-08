import 'package:flutter/material.dart';

class OpcionesDocente extends StatelessWidget {
  static const opcionesDocente = "Opciones-Docente ";

  const OpcionesDocente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 5, 130),
        toolbarHeight: 80,
        title: const Text(
          "Opciones Docente",
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
    );
  }
}
